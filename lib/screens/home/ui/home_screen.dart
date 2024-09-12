import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CardSwiperController _swiperController = CardSwiperController();
  String heading = "MIEL";
  List<String> news = [
    "Infrastructure Investment Surge: Investors Eagerly Eye Lucrative Opportunities in Global Road Tenders",
    "Cutting-Edge Technology Takes Center Stage in Road Tenders as Public-Private Partnerships Flourish",
    "Navigating Road Tenders: Investors Leverage Data Insights to Make Informed Infrastructure Investment Choices",
    "Green Initiatives Drive Demand: Renewable Energy Integration a Key Focus in Modern Road Tender Projects",
  ];
  List<Container> cards = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 4,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/roads.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "PROVIDING PROFESSIONAL ENGINEERING SERVICES.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 4,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/train.jpg",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "OFFERS UNMATCHED OPPORTUNITIES & GROWTH.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/build_back.jpg",
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "GROUP OF CONSULTANCY SERVICES.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 4,
            color: Colors.black26,
            offset: Offset(0, 2),
          ),
        ],
      ),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 4), (timer) {
      _swiperController.swipe(CardSwiperDirection.bottom);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData.light(useMaterial3: false),
      child: Container(
        child: ParallaxStack(
          touchBased: true,
          referencePosition: 0.5,
          layers: [
            // ParallaxLayer(
            //   yRotation: 0,
            //   xOffset: 0,
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            //     child: Container(
            //       color: Colors.black26,
            //       height: size.height,
            //       width: size.width,
            //     ),
            //   ),
            // ),
            ParallaxLayer(
              yRotation: 0.04,
              xRotation: 0.04,
              xOffset: 4,
              yOffset: 4,
              enable3d: true,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width < 1140 ? 26.0 : 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Welcome to!\n",
                                style: GoogleFonts.raleway(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: MouseRegion(
                                      onEnter: (event) {
                                        heading = "Mangalam Infra and Engineering Limited";
                                        setState(() {});
                                      },
                                      onExit: (event) {
                                        heading = "MIEL";
                                        setState(() {});
                                      },
                                      child: TextAnimator(
                                        heading,
                                        maxLines: 2,
                                        incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
                                        outgoingEffect: WidgetTransitionEffects.outgoingSlideOutToLeft(),
                                        style: GoogleFonts.orbitron(fontSize: heading.length > 4 ? 40 : 64, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade800),
                                      ),
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width < 1140 ? 26.0 : 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 780,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Card(
                                      elevation: 12,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      color: Colors.white,
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Marquee(
                                                  text: "✦ LIST OF DELINQUENT EMPLOYEES WHO QUIT THE JOBS UNPROFESSIONALLY(LIST OF BLACKLISTED EMPLOYEES) ✦",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.deepPurple,
                                                  ),
                                                  scrollAxis: Axis.horizontal,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  blankSpace: 180.0,
                                                  velocity: 40.0,
                                                  pauseAfterRound: Duration(seconds: 1),
                                                  startPadding: 10.0,
                                                  accelerationDuration: Duration(seconds: 1),
                                                  accelerationCurve: Curves.linear,
                                                  decelerationDuration: Duration(milliseconds: 500),
                                                  decelerationCurve: Curves.easeOut,
                                                ),
                                              ),
                                            ),
                                            Divider(),
                                            RichText(
                                              textWidthBasis: TextWidthBasis.longestLine,
                                              textAlign: TextAlign.justify,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(text: "Daily ", style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black), children: [
                                                    TextSpan(
                                                      text: "News\n",
                                                      style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                                    )
                                                  ]),
                                                  WidgetSpan(child: SizedBox(width: 170, child: Divider())),
                                                  TextSpan(
                                                    text: "\n",
                                                    style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                                  ),
                                                  WidgetSpan(
                                                      child: Container(
                                                          height: 100,
                                                          width: size.width,
                                                          child: Swiper(
                                                            control: SwiperControl(),
                                                            layout: SwiperLayout.DEFAULT,
                                                            allowImplicitScrolling: true,
                                                            autoplay: true,
                                                            controller: SwiperController(),
                                                            indicatorLayout: PageIndicatorLayout.SCALE,
                                                            itemWidth: 400.0,
                                                            itemHeight: 180.0,
                                                            itemBuilder: (context, index) {
                                                              return Center(
                                                                child: Container(
                                                                  width: 400,
                                                                  child: Text(
                                                                    "\"${news[index]}\"",
                                                                    textAlign: TextAlign.center,
                                                                    style: GoogleFonts.comfortaa(
                                                                      fontStyle: FontStyle.italic,
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            viewportFraction: 0.9,
                                                            itemCount: news.length,
                                                          )))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Card(
                                    elevation: 12,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          RichText(
                                            maxLines: 15,
                                            overflow: TextOverflow.ellipsis,
                                            textWidthBasis: TextWidthBasis.longestLine,
                                            textAlign: TextAlign.justify,
                                            text: TextSpan(children: [
                                              TextSpan(text: "Company ", style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black), children: [
                                                TextSpan(
                                                  text: "Overview\n",
                                                  style: GoogleFonts.raleway(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                                )
                                              ]),
                                              WidgetSpan(child: Divider()),
                                              TextSpan(
                                                onEnter: (event) {},
                                                text:
                                                    "Manglam Infra & Engineering Ltd. comprising a wholly owned subsidiary constituted as a civil engineering multi-disciplined consultancy organization with the aim of participating in the infrastructure development of the Nation by providing professional engineering consultancy services. We are providing Infrastructure Consultancy work since 1998. The Group has annual turnover of 151 Crore. We spread over almost entire Nation through our registered office at Bhopal in the state of Madhya Pradesh and 16 Corporate offices in various states of the country. We encompass a sound team of more than 400 qualified and experienced Engineers and Technicians with matching allied and supporting workforce of high professional capabilities. Through our proficient team of Technocrats we deliver quality services with latest and “State-of-the-art” technology to the entire satisfaction of our clients.",
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width > 1270 ? 18 : 16,
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              runAlignment: WrapAlignment.center,
                                              crossAxisAlignment: WrapCrossAlignment.center,
                                              children: List.generate(
                                                  2,
                                                  (index) => Row(
                                                        children: [
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 12,
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                              color: Colors.grey.shade100,
                                                              child: Container(
                                                                  height: size.width > 1377 ? 80 : 62,
                                                                  child: Center(
                                                                    child: ListTile(
                                                                      leading: Icon(
                                                                        index == 0 ? Icons.handyman : Icons.calendar_month,
                                                                        color: Colors.deepPurple,
                                                                      ),
                                                                      title: Text(
                                                                        index == 0 ? "Project" : "Years",
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: GoogleFonts.raleway(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      trailing: Text(
                                                                        index == 0 ? "200+" : "8+",
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: GoogleFonts.quicksand(
                                                                          fontSize: 30,
                                                                          fontWeight: FontWeight.w900,
                                                                          color: Colors.deepPurple,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 12,
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                                              color: Colors.grey.shade100,
                                                              child: Container(
                                                                  height: size.width > 1377 ? 80 : 62,
                                                                  child: Center(
                                                                    child: ListTile(
                                                                      leading: Icon(
                                                                        index == 0 ? Icons.person_4 : Icons.hardware,
                                                                        color: Colors.deepPurple,
                                                                      ),
                                                                      title: Text(
                                                                        index == 0 ? "Client" : "Ongoing Project",
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: GoogleFonts.raleway(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      trailing: Text(
                                                                        index == 0 ? "42+" : "20+",
                                                                        maxLines: 1,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: GoogleFonts.quicksand(
                                                                          fontSize: 30,
                                                                          fontWeight: FontWeight.w900,
                                                                          color: Colors.deepPurple,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 760,
                            child: CardSwiper(
                              controller: _swiperController,
                              padding: EdgeInsets.all(4.0),
                              cardsCount: cards.length,
                              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
