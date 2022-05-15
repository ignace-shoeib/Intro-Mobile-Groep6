import 'package:exam_app/admin/admin_studentgradepage.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:flutter/material.dart';

class AdminEditStudentScore extends StatelessWidget {
  const AdminEditStudentScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              EditStudentScoreTitle(),
              SizedBox(height: 200),
              Expanded(child: StudentGradeScoreText()),
              Expanded(child: EditStudentScoreInput()),
              //SizedBox(height: 10),
              Expanded(
                  flex: 0,
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: SaveChangedScoreButton(),
                  )),
              SizedBox(height: 10),
            ]));
  }
}

class EditStudentScoreTitle extends StatelessWidget {
  const EditStudentScoreTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text("Bewerk de score van ${LoadStudents.currentStudent}",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class EditStudentScoreInput extends StatelessWidget {
  const EditStudentScoreInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 200,
            child: TextField(
              // Als je onchanged erbij doet gaat problemen weg
              //onChanged: (value) => StudentAnswer.answer = value,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nieuwe score",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
              maxLines: 1,
            )));
  }
}

class SaveChangedScoreButton extends StatefulWidget {
  const SaveChangedScoreButton({Key? key}) : super(key: key);

  @override
  State<SaveChangedScoreButton> createState() => SaveChangedScoreButtonState();
}

class SaveChangedScoreButtonState extends State<SaveChangedScoreButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text('Bewerking opslaan'),
          onPressed: () {}),
    );
  }
}
