import 'package:exam_app/questions/save_question_button.dart';
import 'package:flutter/material.dart';

class OpenQuestionAnswerPage extends StatelessWidget {
  const OpenQuestionAnswerPage({Key? key}) : super(key: key);

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
              OpenQuestionAnswerTitle(),
              SizedBox(height: 20),
              Expanded(child: OpenQuestion()),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SaveQuestionButton(),
              )),
              SizedBox(height: 50),
            ]));
  }
}

class OpenQuestionAnswerTitle extends StatelessWidget {
  const OpenQuestionAnswerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Open vraag",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class OpenQuestion extends StatelessWidget {
  const OpenQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Text("Placeholder hier komt de open vraag",
          style: TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}
