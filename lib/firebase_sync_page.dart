import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:exam_app/message_box.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:exam_app/student/student.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseSync extends StatelessWidget {
  const FirebaseSync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(child: StudentUploadButton()),
            Center(child: StudentDownloadButton())
          ],
        ));
  }
}

class StudentUploadButton extends StatefulWidget {
  const StudentUploadButton({Key? key}) : super(key: key);

  @override
  State<StudentUploadButton> createState() => StudentUploadState();
}

class StudentUploadState extends State<StudentUploadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () async {
            for (var i = 0; i < LoadStudents.students.length; i++) {
              DatabaseReference ref =
                  FirebaseDatabase.instance.ref("students/$i");
              await ref.set({
                "studentNr": LoadStudents.students[i].studentNr,
                "studentName": LoadStudents.students[i].studentName,
              });
            }
            MessageBox.showMessageBox(
                "Succes",
                "De studenten zijn succesvol geüpload naar de database.",
                context);
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("Upload studenten"),
        ));
  }
}

class StudentDownloadButton extends StatefulWidget {
  const StudentDownloadButton({Key? key}) : super(key: key);

  @override
  State<StudentDownloadButton> createState() => StudentDownloadState();
}

class StudentDownloadState extends State<StudentDownloadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () async {
            final ref = FirebaseDatabase.instance.ref();
            final snapshot = await ref.child("students").get();
            var encoded = json.encode(snapshot.value);
            List<dynamic> encodedStudents = json.decode(encoded);
            List<Student> students = [];
            for (var i = 0; i < encodedStudents.length; i++) {
              students.add(Student(
                  studentNr: encodedStudents[i]["studentNr"],
                  studentName: encodedStudents[i]["studentName"]));
            }
            LoadStudents.students = students;
            LoadStudents.students
                .sort((a, b) => a.studentNr!.compareTo(b.studentNr!));
            List<List<dynamic>> csvData = [LoadStudents.students];
            final csv = CsvCodec();
            final csvString =
                csv.encoder.convert(csvData).replaceAll(',', "\n");
            var file = await _localFile;
            file.writeAsString(csvString);
            MessageBox.showMessageBox(
                "Succes",
                "De studenten zijn succesvol gedownload van de database.",
                context);
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("Download studenten"),
        ));
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
