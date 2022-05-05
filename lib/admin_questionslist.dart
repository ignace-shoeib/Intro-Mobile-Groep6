import 'package:flutter/material.dart';

class QuestionsList extends StatefulWidget {
  const QuestionsList({Key? key}) : super(key: key);

  @override
  State<QuestionsList> createState() => QuestionsListState();
}

class QuestionsListState extends State<QuestionsList> {
  List<String> vragen = [
    "Wat is jouw mama's verjaardag?",
    "Hoeveel is 2 + 2?",
    "Alan is een patathoofd",
    "Bruh",
    "Bruh",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: vragen.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black54,
                title: Text(vragen[index]),
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
      body: const QuestionsList(),
    );
  }
}
