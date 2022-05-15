import 'package:exam_app/exam_timer.dart';
import 'package:exam_app/questions/current_question.dart';
import 'package:exam_app/questions/load_questions.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../questions/code_question_answer.dart';
import '../questions/multiple_choice_answer.dart';
import '../questions/open_question_answer.dart';

class StudentQuestionPage extends StatelessWidget {
  const StudentQuestionPage({Key? key}) : super(key: key);

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
              Title(),
              ExamTimer(),
              SizedBox(height: 20),
              Expanded(child: StudentQuestionsList()),
              SizedBox(height: 10),
              Expanded(
                  flex: 0,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: StopExamButton(),
                  )),
              SizedBox(height: 10),
            ]));
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

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
          itemCount: LoadQuestions.listQuestions.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black54,
                title: Text(LoadQuestions.listQuestions[index]["question"]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    CurrentQuestion.currentQuestion =
                        LoadQuestions.listQuestions[index]["question"];
                    CurrentQuestion.currentOptions =
                        LoadQuestions.listQuestions[index]["options"];
                    CurrentQuestion.currentCorrectAnswer =
                        LoadQuestions.listQuestions[index]["answer"];
                    if (LoadQuestions.listQuestions[index]["type"] ==
                        "multiple choice") {
                      return const MultipleChoiceAnswerPage();
                    } else if (LoadQuestions.listQuestions[index]["type"] ==
                        "code correction") {
                      return const CodeQuestionAnswerPage();
                    } else {
                      return const OpenQuestionAnswerPage();
                    }
                  }));
                },
              ),
            );
          }),
    );
  }
}
