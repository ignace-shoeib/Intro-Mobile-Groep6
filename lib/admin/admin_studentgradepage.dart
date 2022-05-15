import 'package:exam_app/detect_app_closed.dart';
import 'package:flutter/material.dart';
import 'admin_student_answers.dart';
import 'admin_student_location.dart';

class AdminStudentGrade extends StatelessWidget {
  const AdminStudentGrade({Key? key}) : super(key: key);

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
            const AddStudentGradeTitle(),
            const SizedBox(height: 200),
            const Text('Punten', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            const StudentGradeScoreText(),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  LocationButton(),
                  SizedBox(width: 10),
                  EditButton(),
                  SizedBox(width: 10),
                  AnswersButton()
                ],
              ),
            )
          ],
        ));
  }
}

class AddStudentGradeTitle extends StatelessWidget {
  const AddStudentGradeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Text("Details [Place-holder]",
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentLocationPage()));
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("Location"),
        ));
  }
}

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
