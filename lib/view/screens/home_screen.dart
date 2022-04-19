// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app/controller/controller.dart';
import 'package:student_app/model/database.dart';
import 'package:student_app/utils/box.dart';
import 'package:student_app/utils/enum.dart';
import 'package:student_app/view/screens/detail_screen.dart';
import 'package:student_app/view/screens/report_screen.dart';
import 'package:student_app/view/widgets/glass_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(Controller());
  final _box = Boxes.getInstance();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
        title: Text(
          "Reports",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(_size.width, _size.height),
            painter: RPSCustomPainter(),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            height: _size.height,
            width: _size.width,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ValueListenableBuilder(
                        valueListenable: _box.listenable(),
                        builder: (BuildContext context,
                            Box<DatabaseModel> newValue, _) {
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var result = newValue.values.toList();
                                return GlassMorphism(
                                  child: Container(
                                    height: _size.height * .1,
                                    alignment: Alignment.center,
                                    child: ListTile(
                                      onTap: () async {
                                        await Get.to(DetailsScreen(
                                          data: result,
                                          index: index,
                                        ));
                                      },
                                      leading: result[index].pic == null
                                          ? const CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "assets/profile_pic.png"),
                                            )
                                          : CircleAvatar(
                                              radius: 40,
                                              backgroundImage: MemoryImage(
                                                  result[index].pic)),
                                      title: Text(
                                        result[index].title ?? "error",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 20,
                                  ),
                              itemCount: _box.length);
                        })
                  ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xff05d6f0),
          onPressed: () async {
            await Get.to(ReportScreen(
              screen: Report.add,
            ));
          },
          label: Text(
            "Report",
            style: GoogleFonts.roboto(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
