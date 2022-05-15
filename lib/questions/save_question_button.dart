import 'package:exam_app/questions/student_answer.dart';
import 'package:flutter/material.dart';

class SaveQuestionButton extends StatefulWidget {
  const SaveQuestionButton({Key? key}) : super(key: key);

  @override
  State<SaveQuestionButton> createState() => SaveQuestionButtonState();
}

class SaveQuestionButtonState extends State<SaveQuestionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.red)),
      child: const Text('Vraag opslaan'),
      onPressed: () {
        print(StudentAnswer.answer);
        Navigator.pop(context);
      },
    );
  }
}
