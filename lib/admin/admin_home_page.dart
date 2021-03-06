import 'package:exam_app/admin/admin_password_change_page.dart';
import 'package:exam_app/firebase_sync_page.dart';
import 'package:exam_app/admin/admin_studentlistpage.dart';
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
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("Syncroniseer"),
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
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              minimumSize: const Size(400, 35)),
          child: const Text("Examens"),
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
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentListPage()));
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("Studenten"),
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
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: const Text("Wachtwoord wijzigen")));
  }
}
