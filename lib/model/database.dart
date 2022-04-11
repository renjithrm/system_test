import 'dart:ffi';

import 'package:hive/hive.dart';
part 'database.g.dart';

@HiveType(typeId: 1)
class DatabaseModel extends HiveObject {
  @HiveField(10)
  int? id;
  @HiveField(11)
  String? title;
  @HiveField(12)
  String? address;
  @HiveField(13)
  int? phoneNumber;
  @HiveField(14)
  String? email;
  @HiveField(15)
  String? discription;
  @HiveField(16)
  double? latitude;
  @HiveField(19)
  double? longitude;
  @HiveField(20)
  dynamic pic;

  DatabaseModel(
      {this.id,
      this.title,
      this.address,
      this.phoneNumber,
      this.email,
      this.discription,
      this.latitude,
      this.longitude,
      this.pic});
}
