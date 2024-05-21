import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(100),
            height: 400,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(0, 5),
                ),
              ],
            )),
        Expanded(
          child: Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade900,
              )),
        ),
      ],
    );
  }
}
