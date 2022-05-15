import 'dart:io';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'student.dart';

class LoadStudents {
  static String currentStudent = LoadStudents.students.first.toString();
  static List<Student> students = [];
  static Future<List<Student>> loadStudentsFirstTime() async {
    final file = await _localFile;
    var exists = await file.exists();
    if (!exists) {
      final rawData = await rootBundle.loadString("assets/data.csv");
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(rawData);

      final csv = CsvCodec();
      await file.writeAsString(csv.encoder.convert(listData));
      List<List<String>> splittedCSV = [];
      final splittedData = rawData.split("\n");
      for (var item in splittedData) {
        splittedCSV.add(item.toString().split(";"));
      }
      List<Student> students = [];
      for (var item in splittedCSV) {
        if (item.length >= 2) {
          students.add(Student(
            studentNr: item[0].toString().replaceAll('[', ''),
            studentName: item[1].toString().replaceAll(']', ''),
          ));
        }
      }
      return students;
    } else {
      final rawData = await file.readAsString();
      final splittedData = rawData.split("\n");
      List<List<String>> splittedCSV = [];
      for (var item in splittedData) {
        splittedCSV.add(item.toString().split(";"));
      }
      List<Student> students = [];
      for (var item in splittedCSV) {
        if (item.length >= 2) {
          students.add(Student(
            studentNr:
                item[0].toString().replaceAll('[', '').replaceAll('"', ''),
            studentName:
                item[1].toString().replaceAll(']', '').replaceAll('"', ''),
          ));
        }
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
