import 'package:flutter/cupertino.dart';
import 'package:loyverse_demo/db/models/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database _db;

Future<void> initialiseDB() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
  });
}

Future<void> addStudent(StudentModel value) async {
  _db.rawInsert(
      'INSERT INTO student (name,age) VALUES (?,?)', [value.name, value.age]);
}

Future<void> getAllDatat() async {
  studentListNotifier.value.clear();
  final values = await _db.rawQuery('SELECT * FROM student ');
  print(values);
  values.forEach((map) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  });
}
