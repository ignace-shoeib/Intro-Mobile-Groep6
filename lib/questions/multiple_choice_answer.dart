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
              Expanded(
                child: MultipleChoiceQuestion(),
                flex: 0,
              ),
              Expanded(child: MultiplechoiceAnswer()),
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

class MultipleChoiceTitle extends StatelessWidget {
  const MultipleChoiceTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
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
      alignment: Alignment.center,
      child: Text(CurrentQuestion.currentQuestion,
          style: const TextStyle(color: Colors.white, fontSize: 25)),
    );
  }
}

class MultiplechoiceAnswer extends StatefulWidget {
  const MultiplechoiceAnswer({Key? key}) : super(key: key);

  @override
  State<MultiplechoiceAnswer> createState() => _MultiplechoiceAnswerState();
}

class _MultiplechoiceAnswerState extends State<MultiplechoiceAnswer> {
  String? answer;

  @override
  Widget build(BuildContext context) {
    List<ListTile> options = [];
    for (int i = 0; i < CurrentQuestion.currentOptions!.length; i++) {
      options.add(ListTile(
          title: Text(CurrentQuestion.currentOptions![i],
              style: TextStyle(color: Colors.white, fontSize: 25)),
          leading: Radio<String>(
            fillColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.selected)
                    ? Colors.red
                    : Colors.white),
            activeColor: Colors.red,
            value: CurrentQuestion.currentOptions![i],
            groupValue: answer,
            onChanged: (String? value) {
              setState(() {
                answer = value;
              });
            },
          )));
    }
    return Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              children: options,
            )),
          ],
        ));
  }
}
