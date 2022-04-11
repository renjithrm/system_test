import 'package:hive_flutter/adapters.dart';
import 'package:student_app/model/database.dart';

class Boxes {
  static Box<DatabaseModel> getInstance() =>
      Hive.box<DatabaseModel>("studentsData");
}
