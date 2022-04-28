import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentStartExamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          title: Text("Gradeaid"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 300),
            Center(child: StudentStartExamButton())
          ],
        ));
  }
}

class StudentStartExamButton extends StatefulWidget {
  @override
  State<StudentStartExamButton> createState() => StudentStartExamButtonState();
}

class StudentStartExamButtonState extends State<StudentStartExamButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Start Examen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
