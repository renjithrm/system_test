import 'dart:convert';

import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Controller extends GetxController {
  final _picker = ImagePicker();

  Uint8List? profileImage;

  dynamic pic;

  takeProfilePic(ImageSource source) async {
    try {
      var image = await _picker.pickImage(source: source);
      if (image != null) {
        profileImage = await image.readAsBytes();
        pic = base64Encode(profileImage!);
        print(profileImage);
      }
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
