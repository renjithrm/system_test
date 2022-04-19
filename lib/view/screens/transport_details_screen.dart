import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/utils/const.dart';
import 'package:student_app/utils/enum.dart';

class TransportDetails extends StatelessWidget {
  Enum screen;
  TransportDetails({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          screen == Screen.trans ? "Transport" : "Entertainment",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: screen == Screen.trans
                ? const Color(0xff896eef)
                : const Color(0xff496ef5),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _size.height * 0.4,
              width: _size.width,
              child: Image.asset(
                screen == Screen.trans
                    ? "assets/Bus_Station.png"
                    : "assets/entertainment_image.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: _size.height * .03,
            ),
            sampleText,
          ],
        ),
      ),
    );
  }
}
