import 'dart:io';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'student.dart';

class LoadStudents {
  static List<Student> students = [];
  static Future<List<Student>> loadStudentsFirstTime() async {
    final file = await _localFile;
    var exists = await file.exists();
    if (!exists) {
      final _rawData = await rootBundle.loadString("assets/data.csv");
      List<List<dynamic>> _listData =
          const CsvToListConverter().convert(_rawData);

      final csv = CsvCodec();
      final csvString = csv.encoder.convert(_listData);
      await file.writeAsString(csvString);

      List<List<String>> splittedCSV = [];
      for (var item in _listData) {
        splittedCSV.add(item.toString().split(";"));
      }
      List<Student> students = [];
      for (var item in splittedCSV) {
        students.add(Student(
          studentNr: item[0].toString().replaceAll('[', ''),
          studentName: item[1].toString().replaceAll(']', ''),
        ));
      }
      return students;
    } else {
      final _rawData = await file.readAsString();
      final splittedData = _rawData.split("\n");
      List<List<String>> splittedCSV = [];
      for (var item in splittedData) {
        splittedCSV.add(item.toString().split(";"));
      }
      List<Student> students = [];
      for (var item in splittedCSV) {
        students.add(Student(
          studentNr: item[0].toString().replaceAll('[', ''),
          studentName: item[1].toString().replaceAll(']', ''),
        ));
      }
      return students;
    }
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data_copy.csv');
}
