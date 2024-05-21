import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class LoadingScreen extends StatefulWidget {
  PageController? controller;
  LoadingScreen({super.key, this.controller});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool is_abreviation = true;
  var anim = WidgetRestingEffects.none();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(
      seconds: 3,
    )).whenComplete(() => setState(() {
          is_abreviation = false;
          anim = WidgetRestingEffects.pulse(
            effectStrength: 4,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Center(
        child: Center(
          child: Hero(
            tag: "Heading",
            child: TextAnimator(
              is_abreviation ? "Manglam Infra and Engineering Limited" : 'MIEL',
              incomingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
              outgoingEffect: WidgetTransitionEffects.outgoingOffsetThenScale(),
              atRestEffect: anim,
              style: GoogleFonts.orbitron(
                fontSize: is_abreviation ? 70 : 100,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              initialDelay: const Duration(milliseconds: 0),
              spaceDelay: const Duration(milliseconds: 300),
              characterDelay: const Duration(milliseconds: 0),
              maxLines: 3,
            ),
          )
              .animate(
                delay: Duration(seconds: 4),
                onComplete: (controller) {
                  controller.reverse().whenComplete(() => controller.forward());
                },
              )
              .moveY(duration: Duration(seconds: 1), begin: 1, end: 5),
        ),
      ),
    );
  }
}
