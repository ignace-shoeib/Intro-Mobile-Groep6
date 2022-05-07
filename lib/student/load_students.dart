import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

import 'student.dart';

class LoadStudents {
  static List<Student> students = [];
  static Future<List<Student>> loadStudents() async {
    final _rawData = await rootBundle.loadString("assets/data.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    List<List<String>> splittedCSV = [];
    for (var item in _listData) {
      splittedCSV.add(item.toString().split(";"));
    }
    List<Student> students = [];
    for (var item in splittedCSV) {
      students.add(Student(item[0].toString().replaceAll('[', ''),
          item[1].toString().replaceAll(']', '')));
    }
    return students;
  }
}
