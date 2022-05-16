import 'package:flutter/material.dart';

import '../student/load_students.dart';

class StudentAnswersInfoPage extends StatelessWidget {
  const StudentAnswersInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(children: const [
          StudentAnswersInfoTitle(),
          SizedBox(height: 20),
          Expanded(child: StudentAnswersInfoText())
        ]));
  }
}

class StudentAnswersInfoTitle extends StatelessWidget {
  const StudentAnswersInfoTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text("Antwoord van ${LoadStudents.currentStudent}",
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class StudentAnswersInfoText extends StatelessWidget {
  const StudentAnswersInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text(
          "Op de (type vraag) vraag x, \nheeft de student het volgende geantwoord: x. \n\nHet correcte antwoord is: x. \nDit is dus (juist/fout).",
          style: TextStyle(color: Colors.white, fontSize: 20, height: 1.5)),
    );
  }
}
