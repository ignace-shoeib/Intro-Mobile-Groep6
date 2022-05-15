import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

List<dynamic> questions = [];

/*
void getData() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child("questions").get();
  var encoded = json.encode(snapshot.value);
  var encodedQuestions = json.decode(encoded);
  var test = Map<String, dynamic>.from(encodedQuestions);
  for (var key in test.keys) {
    var lol = Map<String, dynamic>.from(test[key]);
    for (var key2 in lol.keys) {
      print(key2 + ": " + lol[key2].toString());
    }
    print(lol.runtimeType);
    questions = lol.values.toList();
  }
}
*/

Future<dynamic> getData() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child("questions").get();
  var encoded = json.encode(snapshot.value);
  var encodedQuestions = json.decode(encoded);
  var test = Map<String, dynamic>.from(encodedQuestions);
  for (var key in test.keys) {
    var lol = Map<String, dynamic>.from(test[key]);
    for (var key2 in lol.keys) {
      print("$key2: ${lol[key2]}");
    }
    print(lol.runtimeType);
    questions = lol.values.toList();
  }
  return questions;
}

class FireBaseTest extends StatefulWidget {
  const FireBaseTest({Key? key}) : super(key: key);

  @override
  createState() => _FireBaseTestState();
}

class _FireBaseTestState extends State<FireBaseTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("View Data")),
        body: Column(
          children: const [
            Expanded(child: FbQuestionsList()),
          ],
        ));
  }
}

class FbQuestionsList extends StatefulWidget {
  const FbQuestionsList({Key? key}) : super(key: key);

  @override
  State<FbQuestionsList> createState() => FbQuestionsListState();
}

class FbQuestionsListState extends State<FbQuestionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  tileColor: Colors.black54,
                  title: Text(questions[index]),
                ),
              );
            }));
  }
}
