import 'package:exam_app/AdminPasswordChangePage.dart';
import 'package:exam_app/FirebaseSyncPage.dart';
import 'package:flutter/material.dart';
import 'admin_exampage.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

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
          children: const [
            Center(child: FirebaseBackupButton()),
            SizedBox(height: 20),
            Center(child: ExamensButton()),
            SizedBox(height: 20),
            Center(child: StudentenButton()),
            ChangePasswordButton(),
          ],
        ));
  }
}

class FirebaseBackupButton extends StatefulWidget {
  const FirebaseBackupButton({Key? key}) : super(key: key);

  @override
  State<FirebaseBackupButton> createState() => FirebaseBackupButtonState();
}

class FirebaseBackupButtonState extends State<FirebaseBackupButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FirebaseSync()));
          },
          child: const Text("Firebase Backup"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class ExamensButton extends StatefulWidget {
  const ExamensButton({Key? key}) : super(key: key);

  @override
  State<ExamensButton> createState() => ExamensButtonState();
}

class ExamensButtonState extends State<ExamensButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AdminExamPage()));
          },
          child: const Text("Examens"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class StudentenButton extends StatefulWidget {
  const StudentenButton({Key? key}) : super(key: key);

  @override
  State<StudentenButton> createState() => StudentenButtonState();
}

class StudentenButtonState extends State<StudentenButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: const Text("Studenten"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class ChangePasswordButton extends StatefulWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  State<ChangePasswordButton> createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminPasswordChange()));
            },
            child: const Text("Wachtwoord wijzigen"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}
