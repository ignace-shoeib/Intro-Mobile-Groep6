import 'package:exam_app/questions/current_question.dart';
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
              Expanded(
                child: OpenQuestion(),
                flex: 0,
              ),
              Expanded(child: OpenQuestionAnswer()),
              SizedBox(height: 10),
              Expanded(
                  flex: 0,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SaveQuestionButton(),
                  )),
              SizedBox(height: 10),
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
    return Align(
      alignment: Alignment.center,
      child: Text(CurrentQuestion.currentQuestion,
          style: const TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}

class OpenQuestionAnswer extends StatelessWidget {
  const OpenQuestionAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            width: 600,
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Antwoord",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
              maxLines: 40,
            )));
  }
}
