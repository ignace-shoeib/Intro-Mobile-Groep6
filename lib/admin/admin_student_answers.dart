import 'package:exam_app/student/load_students.dart';
import 'package:flutter/material.dart';

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

final List<String> entries = <String>['A', 'B', 'C'];

class AdminListviewStudentsAnswers extends StatelessWidget {
  const AdminListviewStudentsAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  onTap: () {},
                  tileColor: Colors.black54,
                  title: Text(entries[index])));
        },
      ),
    );
  }
}
