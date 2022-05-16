import 'package:exam_app/admin/admin_studentgradepage.dart';
import 'package:exam_app/message_box.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:firebase_database/firebase_database.dart';
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
            children: [
              EditStudentScoreTitle(),
              Expanded(child: StudentGradeScoreText()),
              Expanded(flex: 0, child: EditStudentScoreInput()),
              SizedBox(height: 10),
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
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class EditStudentScoreInput extends StatelessWidget {
  const EditStudentScoreInput({Key? key}) : super(key: key);
  static String score = '';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 200,
            child: TextField(
              // Als je onchanged erbij doet gaat problemen weg
              onChanged: (value) => score = value,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
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
          onPressed: () async {
            DatabaseReference ref = FirebaseDatabase.instance
                .ref("answers/${LoadStudents.currentStudent.trim()}/metadata");
            await ref.set({
              "score": EditStudentScoreInput.score,
            });
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                      title: Text("succes",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      content: Text(
                          "U heeft de score van ${LoadStudents.currentStudent} veranderd naar ${EditStudentScoreInput.score}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ));
          }),
    );
  }
}
