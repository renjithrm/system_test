import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/controller/controller.dart';

Widget secondaryTitle({required String title}) {
  return Text(
    title,
    style: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
}

// give space in colum
Widget columDiv({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

var sampleText = const Text(
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");

Widget form(
    {String? Function(String?)? validator,
    TextEditingController? controller,
    int? maxLines = 1,
    TextInputType? keyboardType,
    required String label,
    Widget? prefixIcon}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    maxLines: maxLines,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      fillColor: Colors.grey[400],
      filled: true,
      prefixIcon: prefixIcon,
      label: Text(
        label,
        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

// validate form

final requriedValidation =
    RequiredValidator(errorText: "This field is requried");

// pik image
Widget profileImage() {
  return InkWell(
    onTap: () {
      showBottomSheets(
        onTapCamera: () =>
            Get.find<Controller>().takeProfilePic(ImageSource.camera),
        onTapGallery: () =>
            Get.find<Controller>().takeProfilePic(ImageSource.gallery),
      );
    },
    child: Get.find<Controller>().profileImage == null
        ? const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/profile_pic.png"),
          )
        : CircleAvatar(
            radius: 60,
            backgroundImage: MemoryImage(Get.find<Controller>().profileImage!),
          ),
  );
}

showBottomSheets({
  void Function()? onTapCamera,
  void Function()? onTapGallery,
}) async {
  return await Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: 150,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onTapCamera,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: const Center(
                child: Icon(Icons.camera),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: onTapGallery,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: const Center(
                child: Icon(Icons.image),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
