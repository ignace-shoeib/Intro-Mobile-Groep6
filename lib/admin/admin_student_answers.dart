import 'dart:convert';
import 'package:exam_app/student/load_students.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'admin_student_answers_info.dart';

class StudentAnswersPage extends StatelessWidget {
  const StudentAnswersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(children: const [
          StudentAnswersTitle(),
          SizedBox(height: 20),
          Expanded(child: AdminListviewStudentsAnswers())
        ]));
  }
}

class StudentAnswersTitle extends StatelessWidget {
  const StudentAnswersTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text("Antwoorden van ${LoadStudents.currentStudent}",
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class GetData {
  static Future<String> getData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child("answers/${LoadStudents.currentStudent.trim()}").get();
    var encoded = json.encode(snapshot.value);
    return encoded;
  }
}

class AdminListviewStudentsAnswers extends StatelessWidget {
  const AdminListviewStudentsAnswers({Key? key}) : super(key: key);
  static late List<String> entries;
  static late List<String> types;
  static late List<String> studentAnswers;
  static late List<String> correctAnswers;
  static late int currentIndex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: GetData.getData(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          Scaffold scaffold = const Scaffold();
          try {
            entries = [];
            types = [];
            studentAnswers = [];
            correctAnswers = [];
            String data = snapshot.data!;
            var jsonData = jsonDecode(data);
            for (var key in jsonData.keys) {
              if (key != "metadata") {
                entries.add(jsonData[key]["question"]);
                types.add(jsonData[key]["type"]);
                studentAnswers.add(jsonData[key]["studentAnswer"]);
                correctAnswers.add(jsonData[key]["correctAnswer"]);
              }
            }
            scaffold = Scaffold(
              body: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                          onTap: () {
                            currentIndex = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentAnswersInfoPage()),
                            );
                          },
                          tileColor: Colors.black54,
                          title: Text(entries[index])));
                },
              ),
            );
          } catch (e) {}
          return scaffold;
        });
  }
}
