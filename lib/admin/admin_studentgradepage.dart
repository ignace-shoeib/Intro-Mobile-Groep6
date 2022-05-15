import 'package:exam_app/detect_app_closed.dart';
import 'package:exam_app/student/student.dart';
import 'package:flutter/material.dart';
import 'admin_student_answers.dart';
import 'admin_student_location.dart';

class AdminStudentGrade extends StatelessWidget {
  AdminStudentGrade({
    Key? key,
    required this.studentNr,
  }) : super(key: key);

  String studentNr;

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
          children: [
            const SizedBox(height: 20),
            StudentGradeTitle(studentNr: studentNr),
            const SizedBox(height: 200),
            const Text('Punten', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            const StudentGradeScoreText(),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentLocationPage()));
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: const Text("Location"),
                      )),
                  const SizedBox(width: 10),
                  const EditButton(),
                  const SizedBox(width: 10),
                  const AnswersButton()
                ],
              ),
            )
          ],
        ));
  }
}

class StudentGradeTitle extends StatelessWidget {
  const StudentGradeTitle({
    Key? key,
    required this.studentNr,
  }) : super(key: key);

  final String studentNr;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text("Details ${this.studentNr}",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class StudentGradeScoreText extends StatelessWidget {
  const StudentGradeScoreText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text('[2]',
          style: TextStyle(
              color: Colors.red, fontSize: 150, fontWeight: FontWeight.bold)),
    );
  }
}
/*
class LocationButton extends StatefulWidget {
  const LocationButton({Key? key}) : super(key: key);

  @override
  State<LocationButton> createState() => LocationButtonState();
}


class LocationButtonState extends State<LocationButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudentLocationPage()));
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("Location"),
        ));
  }
}
*/

class EditButton extends StatefulWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  State<EditButton> createState() => EditButtonState();
}

class EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: ElevatedButton(
          // Momenteel herleid deze button u naar een extra page dat niet echt nodig is of wel kies maar voor detect app closed hehe
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DetectAppClosed()));
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.white,
              minimumSize: const Size(400, 35)),
          child: const Text("Bewerken"),
        ));
  }
}

class AnswersButton extends StatefulWidget {
  const AnswersButton({Key? key}) : super(key: key);

  @override
  State<AnswersButton> createState() => AnswersButtonState();
}

class AnswersButtonState extends State<AnswersButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const StudentAnswersPage()));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          onPrimary: Colors.white,
          minimumSize: const Size(400, 35)),
      child: const Text("Antwoorden"),
    ));
  }
}
