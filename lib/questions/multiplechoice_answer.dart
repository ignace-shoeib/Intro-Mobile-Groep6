import 'package:flutter/material.dart';

import '../student/student_vragen_page.dart';

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
              MultiplechoiceTitle(),
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

class MultiplechoiceTitle extends StatelessWidget {
  const MultiplechoiceTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Multiplechoice vraag",
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const StudentVragenPage()));
      },
    );
  }
}
