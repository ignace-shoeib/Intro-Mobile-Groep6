import 'package:exam_app/questions/current_question.dart';
import 'package:flutter/material.dart';

import 'save_question_button.dart';

class MultipleChoiceAnswerPage extends StatelessWidget {
  const MultipleChoiceAnswerPage({Key? key}) : super(key: key);

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
              MultipleChoiceTitle(),
              SizedBox(height: 20),
              Expanded(child: MultipleChoiceQuestion()),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SaveQuestionButton(),
              )),
              SizedBox(height: 50),
            ]));
  }
}

class MultipleChoiceTitle extends StatelessWidget {
  const MultipleChoiceTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Multiple choice vraag",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class MultipleChoiceQuestion extends StatelessWidget {
  const MultipleChoiceQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(CurrentQuestion.currentQuestion,
          style: const TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}
