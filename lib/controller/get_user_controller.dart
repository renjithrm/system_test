import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GetUserLocation extends GetxController {
  Position? position;

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

  Future getCurrentLocation() async {
    LocationPermission? permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // return position;
    } else {
      print("in");
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log(':::${position!.latitude}::: ${position!.longitude}');
      // return position;
    }
  }
}
