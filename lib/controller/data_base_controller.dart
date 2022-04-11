import 'package:get/get.dart';
import 'package:student_app/model/database.dart';
import 'package:student_app/utils/box.dart';

class DataBaseController extends GetxController {
  final _box = Boxes.getInstance();
  Future addData({
    int? id,
    required String title,
    required String address,
    required int phoneNumber,
    required String email,
    required String discription,
    double? latitude,
    double? longitude,
    dynamic pic,
  }) async {
    var value = DatabaseModel(
        title: title,
        address: address,
        phoneNumber: phoneNumber,
        email: email,
        discription: discription,
        latitude: latitude,
        longitude: longitude,
        pic: pic);
    await _box.add(value);
  }

  Future updateData({
    int? id,
    required String title,
    required String address,
    required int phoneNumber,
    required String email,
    required String discription,
    double? latitude,
    double? longitude,
    dynamic pic,
    required int index,
  }) async {
    var value = DatabaseModel(
        title: title,
        address: address,
        phoneNumber: phoneNumber,
        email: email,
        discription: discription,
        latitude: latitude,
        longitude: longitude,
        pic: pic);
    await _box.putAt(index, value);
  }
}
