import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app/controller/controller.dart';
import 'package:student_app/model/database.dart';
import 'package:student_app/utils/box.dart';
import 'package:student_app/utils/const.dart';
import 'package:student_app/utils/enum.dart';
import 'package:student_app/view/screens/detail_screen.dart';
import 'package:student_app/view/screens/report_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(Controller());
  final _box = Boxes.getInstance();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
        title: Text(
          "Home",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: _size.height,
        width: _size.width,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                secondaryTitle(
                  title: "Students Exams",
                ),
                columDiv(height: _size.height * 0.01),
                sampleText,
                columDiv(height: _size.height * 0.03),
                secondaryTitle(
                  title: "Fees Details",
                ),
                columDiv(height: _size.height * 0.01),
                sampleText,
                columDiv(height: _size.height * 0.03),
                secondaryTitle(
                  title: "Students Reports",
                ),
                columDiv(height: _size.height * 0.03),
                ValueListenableBuilder(
                    valueListenable: _box.listenable(),
                    builder:
                        (BuildContext context, Box<DatabaseModel> newValue, _) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var result = newValue.values.toList();
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                        backgroundImage:
                                            MemoryImage(result[index].pic)),
                                title: Text(result[index].title ?? "error"),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: _box.length);
                    })
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Get.to(ReportScreen(
              screen: Report.add,
            ));
          },
          label: const Text("Report")),
    );
  }
}
