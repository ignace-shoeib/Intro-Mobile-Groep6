import 'package:flutter/material.dart';

class StudenAnswersPage extends StatelessWidget {
  const StudenAnswersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(children: [
          const StudentAnswersTitle(),
          const SizedBox(height: 20),
        ]));
  }
}

class StudentAnswersTitle extends StatelessWidget {
  const StudentAnswersTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Student antwoorden",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}
