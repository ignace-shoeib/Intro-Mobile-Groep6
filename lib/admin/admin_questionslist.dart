import 'package:exam_app/questions/load_questions.dart';
import 'package:flutter/material.dart';

class QuestionListTitle extends StatelessWidget {
  const QuestionListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Huidige vragen",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class QuestionsList extends StatefulWidget {
  const QuestionsList({Key? key}) : super(key: key);

  @override
  State<QuestionsList> createState() => QuestionsListState();
}

class QuestionsListState extends State<QuestionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: LoadQuestions.listQuestions.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black54,
                title: Text(LoadQuestions.listQuestions[index]["question"]),
              ),
            );
          }),
    );
  }
}

class QuestionsListPage extends StatefulWidget {
  const QuestionsListPage({Key? key}) : super(key: key);

  @override
  State<QuestionsListPage> createState() => QuestionsListPageState();
}

class QuestionsListPageState extends State<QuestionsListPage> {
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
            QuestionListTitle(),
            SizedBox(height: 20),
            Expanded(child: QuestionsList()),
          ],
        ));
  }
}
