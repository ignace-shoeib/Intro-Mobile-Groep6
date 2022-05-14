import 'package:exam_app/questions/load_questions.dart';
import 'package:flutter/material.dart';

import '../questions/code_question_answer.dart';
import '../questions/multiplechoice_answer.dart';
import '../questions/open_question_answer.dart';

class StudentVragenPage extends StatelessWidget {
  const StudentVragenPage({Key? key}) : super(key: key);

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
              AdminLoginTitle(),
              SizedBox(height: 20),
              Expanded(child: StudentQuestionsList()),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: StopExamButton(),
              )),
              Expanded(child: TempMultipleQuestionAnswerButton()),
              Expanded(child: TempOpenQuestionAnswerButton()),
              Expanded(child: TempCodeQuestionAnswerButton()),
              SizedBox(height: 50),
            ]));
  }
}

class AdminLoginTitle extends StatelessWidget {
  const AdminLoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Vragen",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class StopExamButton extends StatefulWidget {
  const StopExamButton({Key? key}) : super(key: key);

  @override
  State<StopExamButton> createState() => StopExamButtonState();
}

class StopExamButtonState extends State<StopExamButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.red)),
      child: const Text('Beëindig examen'),
      onPressed: () {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                  title: const Text('Wilt u zeker het examen beëindigen?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Nee'),
                      child: const Text(
                        'Nee',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: const Text(
                        'Ja',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ));
      },
    );
  }
}

class StudentQuestionsList extends StatefulWidget {
  const StudentQuestionsList({Key? key}) : super(key: key);

  @override
  State<StudentQuestionsList> createState() => StudentQuestionsListState();
}

class StudentQuestionsListState extends State<StudentQuestionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: LoadQuestions.questions.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black54,
                title: Text(LoadQuestions.questions[index]),
              ),
            );
          }),
    );
  }
}

// Temp for testing multiple question
class TempMultipleQuestionAnswerButton extends StatefulWidget {
  const TempMultipleQuestionAnswerButton({Key? key}) : super(key: key);

  @override
  State<TempMultipleQuestionAnswerButton> createState() =>
      TempMultipleQuestionAnswerButtonState();
}

class TempMultipleQuestionAnswerButtonState
    extends State<TempMultipleQuestionAnswerButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MultipleChoiceAnswerPage()));
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: const Text("Temp button naar multipe vraag")));
  }
}

// Temp for testing open question
class TempOpenQuestionAnswerButton extends StatefulWidget {
  const TempOpenQuestionAnswerButton({Key? key}) : super(key: key);

  @override
  State<TempOpenQuestionAnswerButton> createState() =>
      TempOpenQuestionAnswerButtonState();
}

class TempOpenQuestionAnswerButtonState
    extends State<TempOpenQuestionAnswerButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OpenQuestionAnswerPage()));
            },
            child: const Text("Temp button naar open vraag"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}

// Temp for testing code question
class TempCodeQuestionAnswerButton extends StatefulWidget {
  const TempCodeQuestionAnswerButton({Key? key}) : super(key: key);

  @override
  State<TempCodeQuestionAnswerButton> createState() =>
      TempCodeQuestionAnswerButtonState();
}

class TempCodeQuestionAnswerButtonState
    extends State<TempCodeQuestionAnswerButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CodeQuestionAnswerPage()));
            },
            child: const Text("Temp button naar code vraag"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}
