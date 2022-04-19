import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app/controller/controller.dart';
import 'package:student_app/model/database.dart';
import 'package:student_app/utils/box.dart';
import 'package:student_app/utils/const.dart';
import 'package:student_app/utils/enum.dart';
import 'package:student_app/view/screens/report_screen.dart';

class DetailsScreen extends StatelessWidget {
  List<DatabaseModel> data;
  int index;
  DetailsScreen({Key? key, required this.data, required this.index})
      : super(key: key);
  final _box = Boxes.getInstance();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ReportScreen(
                  screen: Report.edit,
                  data: data,
                  index: index,
                ));
                Get.find<Controller>().profileImage = data[index].pic;
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await _box.deleteAt(index);
                Get.back();
              },
              icon: const Icon(Icons.delete)),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
        title: Text(
          "Student Report",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: const EdgeInsets.all(15),
        color: const Color(0xff31305a),
        child: Column(
          children: <Widget>[
            columDiv(height: _size.height * 0.02),
            data[index].pic == null
                ? const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/profile_pic.png"),
                  )
                : CircleAvatar(
                    radius: 60,
                    backgroundImage: MemoryImage(data[index].pic),
                  ),
            columDiv(height: _size.height * 0.03),
            secondaryTitle(title: data[index].title.toString().toUpperCase()),
            columDiv(height: _size.height * 0.03),
            Flexible(
                child: showDetails(
                    height: _size.height * 0.08,
                    width: _size.width,
                    title: "Address: ${data[index].address}")),
            columDiv(height: _size.height * 0.03),
            Flexible(
                child: showDetails(
                    height: _size.height * 0.08,
                    width: _size.width,
                    title: "Email: ${data[index].email}")),
            columDiv(height: _size.height * 0.03),
            Flexible(
                child: showDetails(
                    height: _size.height * 0.4,
                    width: _size.width,
                    title: "Discription: ${data[index].discription}")),
          ],
        ),
      ),
    );
  }

  Widget showDetails({double? width, double? height, required String title}) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 17,
            ),
          )),
    );
  }
}
