import 'dart:convert';
import 'package:exam_app/student/load_students.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../student/load_students.dart';
import 'admin_edit_student_score.dart';
import 'admin_student_answers.dart';
import 'admin_student_location.dart';

class AdminStudentGrade extends StatelessWidget {
  const AdminStudentGrade({
    Key? key,
  }) : super(key: key);

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
            const StudentGradeTitle(),
            const SizedBox(height: 10),
            const StudentExamInfo(),
            const SizedBox(height: 10),
            const StudentGradeScoreText(),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const StudentLocationPage()));
                          },
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          child: const Text("Location"))),
                  const SizedBox(width: 10),
                  const EditButton(),
                  const SizedBox(width: 10),
                  const AnswersButton()
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}

class StudentGradeTitle extends StatelessWidget {
  const StudentGradeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text("Details ${LoadStudents.currentStudent}",
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

String formatTime(int seconds) {
  return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
}

class StudentExamInfo extends StatelessWidget {
  const StudentExamInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: GetData.getData(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          Align align = const Align();
          try {
            String data = snapshot.data!;
            var jsonData = jsonDecode(data);
            String left = jsonData["timesLeft"].toString();
            String time = formatTime(jsonData["seconds"]);
            align = Align(
              alignment: Alignment.topCenter,
              child: Text(
                  "De student heeft het examen $left keer verlaten,\n dit examen heeft de student afgelegd in $time uren.",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            );
          } catch (e) {}
          return align;
        });
  }
}

class StudentGradeScoreText extends StatelessWidget {
  const StudentGradeScoreText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
          Text('Punten', style: TextStyle(color: Colors.white)),
          (Text('[2]',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 150,
                  fontWeight: FontWeight.bold))),
        ]));
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
        width: 200,
        child: ElevatedButton(
          // Momenteel herleid deze button u naar een extra page dat niet echt nodig is of wel kies maar voor detect app closed hehe
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AdminEditStudentScore()));
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
        width: 200,
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
