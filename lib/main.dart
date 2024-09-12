import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:website_demo/screens/Projects/ui/project_screen.dart';
import 'package:website_demo/screens/about_us/ui/about_us_screen.dart';
import 'package:website_demo/screens/career/ui/career_screen.dart';
import 'package:website_demo/screens/contact_us/ui/contact_us_screen.dart';
import 'package:website_demo/screens/home/ui/home_screen.dart';
import 'package:website_demo/screens/loading_screen/ui/loading_screen.dart';
import 'package:website_demo/screens/our_investor/ui/our_investor_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController? controller;
  final menu = ["Home", "Project", "Investor", "Career", "About", "Contact"];
  final menuIcon = [Icons.home, Icons.handyman_outlined, Icons.account_balance, Icons.work, Icons.info, Icons.call];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(
      initialPage: 0,
    );
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: Home(size: size, controller: controller, menu: menu),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.size,
    required this.controller,
    required this.menu,
  });

  final Size size;
  final PageController? controller;
  final List<String> menu;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ParticlesFly(
            height: widget.size.height,
            width: widget.size.width,
            connectDots: true,
            numberOfParticles: 100,
            lineColor: Colors.deepPurple.shade700,
            particleColor: Colors.deepPurple.shade700,
          ),
          PageView.custom(
            allowImplicitScrolling: true,
            controller: widget.controller ?? PageController(),
            scrollDirection: Axis.vertical,
            scrollBehavior: CupertinoScrollBehavior(),
            childrenDelegate: SliverChildBuilderDelegate(childCount: widget.menu.length + 1, (context, index) {
              switch (index) {
                case 0:
                  return LoadingScreen(controller: widget.controller ?? PageController());
                case 1:
                  return HomeScreen();
                case 2:
                  return ProjectsScreen();
                case 3:
                  return InvestorScreen();
                case 4:
                  return CareerScreen();
                case 5:
                  return AboutUsScreen();
                case 6:
                  return ContactUsScreen();
              }
            }),
          ),

          Positioned(
            bottom: 20,
            left: widget.size.width < 1140 ? 26.0 : 200.0,
            right: widget.size.width < 1140 ? 26.0 : 200.0,
            child: Theme(
              data: ThemeData.light(useMaterial3: false),
              child: AdaptiveNavBar(
                iconTheme: IconThemeData(color: Colors.deepPurple),
                shadowColor: Colors.black87,
                backgroundColor: Colors.white,
                canTitleGetTapped: true,
                onTitleTapped: () {
                  widget.controller!.animateToPage(0, duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                elevation: 10,
                centerTitle: false,
                toolbarTextStyle: GoogleFonts.comfortaa(fontSize: 12, fontWeight: FontWeight.bold),
                screenWidth: MediaQuery.of(context).size.width - 550,
                title: Text(
                  "MIEL",
                  style: GoogleFonts.orbitron(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                automaticallyImplyLeading: true,
                navBarItems: List.generate(
                  widget.menu.length,
                  (index) => NavBarItem(
                    onTap: () {
                      widget.controller!.animateToPage(index + 1, duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
                    },
                    text: widget.menu[index],
                    radius: 100,
                    splashColor: Colors.white54,
                    hoverColor: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Visibility(
          //     visible: controller.hasClients && controller.page! > 0.99,
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 1140 ? 26.0 : 200.0),
          //       child: Container(
          //         height: 70,
          //         decoration: BoxDecoration(boxShadow: [
          //           BoxShadow(
          //             blurRadius: 5,
          //             color: Colors.black26,
          //             offset: Offset(0, 4),
          //             spreadRadius: 2,
          //           )
          //         ], borderRadius: BorderRadius.circular(100), color: Colors.white),
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          //               child: Text(
          //                 "MIEL",
          //                 style: GoogleFonts.orbitron(
          //                   fontSize: 26,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             Spacer(),
          //             Expanded(
          //               child: Align(
          //                 alignment: Alignment.centerRight,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(12.0),
          //                   child: ListView(
          //                     scrollDirection: Axis.horizontal,
          //                     children: List.generate(
          //                       menu.length,
          //                       (index) => Padding(
          //                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //                         child: ActionChip(
          //                           onPressed: () {
          //                             controller.animateToPage(index + 1, duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
          //                           },
          //                           avatar: Icon(menuIcon[index]),
          //                           elevation: 10,
          //                           shape: RoundedRectangleBorder(
          //                             side: BorderSide.none,
          //                             borderRadius: BorderRadius.circular(100),
          //                           ),
          //                           label: Text(menu[index]),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
