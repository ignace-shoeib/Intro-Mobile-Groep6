import 'dart:convert';
import 'package:exam_app/student/load_students.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StudentLocationPage extends StatelessWidget {
  const StudentLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(children: const [
          PageTitle(),
          SizedBox(height: 10),
          LocationText()
        ]));
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text("Locatie van ${LoadStudents.currentStudent}",
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class GetData {
  static Future<String> getData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child("answers/${LoadStudents.currentStudent.trim()}/metadata")
        .get();
    var encoded = json.encode(snapshot.value);
    return encoded;
  }
}

class LocationText extends StatelessWidget {
  const LocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: GetData.getData(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        String data = snapshot.data!;
        var jsonData = jsonDecode(data);
        String location =
            "${jsonData["location"].toString().replaceAll('{', '').replaceAll('}', '')}\n${jsonData["address"]}";
        return Align(
          alignment: Alignment.bottomCenter,
          child: Text("$location",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
