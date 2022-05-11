import 'dart:convert';
import 'package:exam_app/message_box.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:exam_app/student/student.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
            //const SizedBox(height: ),
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
          child: const Text("Upload studenten"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
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
            MessageBox.showMessageBox(
                "Succes",
                "De studenten zijn succesvol gedownload van de database.",
                context);
          },
          child: const Text("Download studenten"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
