import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static String? id = "ID",
      password='PASSWORD',
      name = "NAME",
      department = "DEPARTMENT",
      section = "SECTIONS";


  static Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("appDetails");
  }

  static void setID(String value) {
    _box!.put(id, value);
  }

  static String getID() {
    return _box!.get(id);
  }
  static void setpassword(String value) {
    _box!.put(password, value);
  }

  static String getpassword() {
    return _box!.get(password);
  }

  static void setName(String value) {
    _box!.put(name, value);
  }

  static String getName() {
    return _box!.get(name);
  }

  static void setSection(String value) {
    _box!.put(section, value);
  }

  static String getSection() {
    return _box!.get(section);
  }

  static void setDepartment(String value) {
    _box!.put(department, value);
  }

  static String getDepartment() {
    return _box!.get(department);
  }

}
