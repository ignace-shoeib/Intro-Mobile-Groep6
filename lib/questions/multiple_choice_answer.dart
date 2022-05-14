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
              Expanded(child: MultiplechoiceQuestion()),
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

class MultiplechoiceQuestion extends StatelessWidget {
  const MultiplechoiceQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Text("Placeholder hier komt de vraag",
          style: TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}
