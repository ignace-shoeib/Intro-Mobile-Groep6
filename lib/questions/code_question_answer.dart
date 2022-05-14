import 'package:exam_app/questions/save_question_button.dart';
import 'package:flutter/material.dart';

class CodeQuestionAnswerPage extends StatelessWidget {
  const CodeQuestionAnswerPage({Key? key}) : super(key: key);

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
              CodeQuestionAnswerTitle(),
              SizedBox(height: 20),
              Expanded(child: CodeQuestion()),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SaveQuestionButton(),
              )),
              SizedBox(height: 50),
            ]));
  }
}

class CodeQuestionAnswerTitle extends StatelessWidget {
  const CodeQuestionAnswerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Code correction vraag",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class CodeQuestion extends StatelessWidget {
  const CodeQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Text("Placeholder hier komt de code vraag",
          style: TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}
