import 'package:exam_app/StudentVragenPage.dart';
import 'package:flutter/material.dart';

class StudentStartExamPage extends StatelessWidget {
  const StudentStartExamPage({Key? key}) : super(key: key);

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
          children: const [Center(child: StudentStartExamButton())],
        ));
  }
}

class StudentStartExamButton extends StatefulWidget {
  const StudentStartExamButton({Key? key}) : super(key: key);

  @override
  State<StudentStartExamButton> createState() => StudentStartExamButtonState();
}

class StudentStartExamButtonState extends State<StudentStartExamButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentVragenPage()));
          },
          child: const Text("Start Examen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
