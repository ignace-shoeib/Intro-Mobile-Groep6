import 'package:exam_app/questions/current_question.dart';
import 'package:exam_app/questions/student_answer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../student/load_students.dart';

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
      onPressed: () async {
        final String student = LoadStudents.currentStudent.trim();

        DatabaseReference ref = FirebaseDatabase.instance
            .ref("answers/$student/${CurrentQuestion.index}");
        await ref.set({
          "question": CurrentQuestion.currentQuestion.toString(),
          "studentAnswer": StudentAnswer.answer.toString(),
          "correctAnswer": CurrentQuestion.currentCorrectAnswer.toString(),
          "type": CurrentQuestion.currentType.toString()
        });
        Navigator.pop(context);
      },
    );
  }
}
