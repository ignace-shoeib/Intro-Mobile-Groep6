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
              Expanded(child: MultiplechoiceAnswer()),
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

enum EnumCorrectWrong { correct, wrong }

class MultiplechoiceAnswer extends StatefulWidget {
  const MultiplechoiceAnswer({Key? key}) : super(key: key);

  @override
  State<MultiplechoiceAnswer> createState() => _MultiplechoiceAnswerState();
}

class _MultiplechoiceAnswerState extends State<MultiplechoiceAnswer> {
  EnumCorrectWrong? _character/*= EnumCorrectWrong.correct*/;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('2',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              leading: Radio<EnumCorrectWrong>(
                value: EnumCorrectWrong.correct,
                groupValue: _character,
                onChanged: (EnumCorrectWrong? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              //tileColor: Colors.black54,
              title: const Text('13',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              leading: Radio<EnumCorrectWrong>(
                value: EnumCorrectWrong.wrong,
                groupValue: _character,
                onChanged: (EnumCorrectWrong? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
