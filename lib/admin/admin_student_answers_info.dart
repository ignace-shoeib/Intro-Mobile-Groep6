import 'package:exam_app/admin/admin_student_answers.dart';
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
    String answer = "";
    if (AdminListviewStudentsAnswers
            .types[AdminListviewStudentsAnswers.currentIndex] ==
        "open") {
      answer = "";
    } else {
      String correctWrong = "";
      if (AdminListviewStudentsAnswers
              .studentAnswers[AdminListviewStudentsAnswers.currentIndex] ==
          AdminListviewStudentsAnswers
              .correctAnswers[AdminListviewStudentsAnswers.currentIndex]) {
        correctWrong = "juist";
      } else {
        correctWrong = "fout";
      }
      answer =
          "\n\nHet correcte antwoord is: \"${AdminListviewStudentsAnswers.correctAnswers[AdminListviewStudentsAnswers.currentIndex]}\" \nDit is dus ${correctWrong}.";
    }
    return Align(
      alignment: Alignment.center,
      child: Text(
          "Op de ${AdminListviewStudentsAnswers.types[AdminListviewStudentsAnswers.currentIndex]} vraag \"${AdminListviewStudentsAnswers.entries[AdminListviewStudentsAnswers.currentIndex]}\" \nheeft de student het volgende geantwoord: ${AdminListviewStudentsAnswers.studentAnswers[AdminListviewStudentsAnswers.currentIndex]}" +
              answer,
          style: TextStyle(color: Colors.white, fontSize: 20, height: 1.5)),
    );
  }
}
