import 'dart:convert';
import 'package:exam_app/exam_timer.dart';
import 'package:exam_app/questions/current_question.dart';
import 'package:exam_app/questions/load_questions.dart';
import 'package:exam_app/questions/student_answer.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import '../questions/code_question_answer.dart';
import 'package:http/http.dart' as http;
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
            children: [
              const Title(),
              const ExamTimer(),
              const SizedBox(height: 20),
              const Expanded(child: StudentQuestionsList()),
              const SizedBox(height: 10),
              const Expanded(
                  flex: 0,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: StopExamButton(),
                  )),
              Transform.translate(
                  offset: const Offset(0, 10),
                  child: SizedBox(
                      height: 10,
                      width: 10,
                      child: OSMFlutter(
                        controller: StopExamButtonState.controller,
                        trackMyPosition: false,
                        initZoom: 16,
                        minZoomLevel: 2,
                        maxZoomLevel: 19,
                        stepZoom: 1.0,
                      )))
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
  static MapController controller =
      MapController(initMapWithUserPosition: true);
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
                      onPressed: () async {
                        final String student =
                            LoadStudents.currentStudent.trim();
                        DatabaseReference ref = FirebaseDatabase.instance
                            .ref("answers/$student/metadata");
                        var location = await controller.myLocation();
                        var address = await http.get(Uri.parse(
                            'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}'));
                        Map<String, dynamic> jsonAddress =
                            json.decode(address.body);
                        await ref.set({
                          "seconds": Time.time,
                          "location": {
                            "lat": location.latitude,
                            "lng": location.longitude
                          },
                          "address": jsonAddress['display_name'],
                          "timesLeft": StudentQuestionsListState.examLeftCounter
                        });
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

class StudentQuestionsListState extends State<StudentQuestionsList>
    with WidgetsBindingObserver {
  static int examLeftCounter = 0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        examLeftCounter++;
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
                    StudentAnswer.answer = "";
                    CurrentQuestion.index = index;
                    CurrentQuestion.currentQuestion =
                        LoadQuestions.listQuestions[index]["question"];
                    CurrentQuestion.currentOptions =
                        LoadQuestions.listQuestions[index]["options"];
                    CurrentQuestion.currentCorrectAnswer =
                        LoadQuestions.listQuestions[index]["answer"];
                    CurrentQuestion.currentType =
                        LoadQuestions.listQuestions[index]["type"];
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
