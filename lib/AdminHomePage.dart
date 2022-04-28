import 'package:exam_app/AdminPasswordChangePage.dart';
import 'package:exam_app/FirebaseSyncPage.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          title: Text("Gradeaid"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: FirebaseBackupButton()),
            const SizedBox(height: 20),
            Center(child: ExamensButton()),
            const SizedBox(height: 20),
            Center(child: StudentenButton()),
            ChangePasswordButton(),
          ],
        ));
  }
}

class FirebaseBackupButton extends StatefulWidget {
  @override
  State<FirebaseBackupButton> createState() => FirebaseBackupButtonState();
}

class FirebaseBackupButtonState extends State<FirebaseBackupButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FirebaseSync()));
          },
          child: Text("Firebase Backup"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class ExamensButton extends StatefulWidget {
  @override
  State<ExamensButton> createState() => ExamensButtonState();
}

class ExamensButtonState extends State<ExamensButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Examens"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class StudentenButton extends StatefulWidget {
  @override
  State<StudentenButton> createState() => StudentenButtonState();
}

class StudentenButtonState extends State<StudentenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Studenten"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class ChangePasswordButton extends StatefulWidget {
  @override
  State<ChangePasswordButton> createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminPasswordChange()));
            },
            child: Text("Wachtwoord wijzigen"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}
