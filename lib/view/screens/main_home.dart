// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/utils/enum.dart';
import 'package:student_app/view/screens/home_screen.dart';
import 'package:student_app/view/screens/transport_details_screen.dart';
import 'package:student_app/view/widgets/glass_widget.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    print(_size.height);
    print(_size.width);
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Home",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: const Color(0xff31305a),
        body: Container(
          child: Stack(children: [
            CustomPaint(
              size: Size(_size.width, _size.height * 0.6),
              painter: CURVECustomPainter(),
            ),
            Container(
              width: _size.width,
              height: _size.height,
              padding: EdgeInsets.only(
                top: _size.height * .1,
                left: _size.width * .02,
                right: _size.width * .02,
              ),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(TransportDetails(
                        screen: Screen.trans,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GlassMorphism(
                        child: Container(
                          width: _size.width * .2,
                          height: _size.height * .03,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xff896eef),
                                radius: 35,
                                child: Center(
                                  child: Icon(
                                    Icons.bus_alert,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _size.height * .03,
                              ),
                              Text(
                                "Transport",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff896eef),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(TransportDetails(
                        screen: Screen.enter,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GlassMorphism(
                        child: Container(
                          width: _size.width * .2,
                          height: _size.height * .03,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xff496ef5),
                                radius: 35,
                                child: Center(
                                  child: Icon(
                                    Icons.movie,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _size.height * .03,
                              ),
                              Text(
                                "Entertainment",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff496ef5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(HomeScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GlassMorphism(
                        child: Container(
                          width: _size.width * .2,
                          height: _size.height * .03,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xff4aacf0),
                                radius: 35,
                                child: Center(
                                  child: Icon(
                                    Icons.report,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _size.height * .03,
                              ),
                              Text(
                                "Reports",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff4aacf0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}

class CURVECustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xfff57ca7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.3408387);
    path0.lineTo(size.width * 0.5102778, size.height * 0.6844040);
    path0.quadraticBezierTo(size.width * 0.9095370, size.height * 0.6979240,
        size.width * 0.8932407, size.height * 0.3412931);
    path0.quadraticBezierTo(size.width * 0.7654167, size.height * 0.2559698,
        size.width * 0.3819444, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height * 0.3408387);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
