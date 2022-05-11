import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class FireBaseTestTwo extends StatefulWidget {
  const FireBaseTestTwo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FireBaseTestTwoState();
}

class FireBaseTestTwoState extends State<FireBaseTestTwo> {
  final databaseReference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("View Data")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final ref = FirebaseDatabase.instance.ref();
                    final snapshot = await ref.child("questions").get();
                    var encoded = json.encode(snapshot.value);
                    List<dynamic> encodedQuestions = json.decode(encoded);
                    List<String> questions = [];
                    for (var question in encodedQuestions) {
                      questions.add(question['question']);
                    }
                  },
                  child: Text("Test")),
              ElevatedButton(onPressed: () {}, child: Text("Test2")),
            ],
          ),
        ));
  }
}
/*
Future<void> getData() async {
  final databaseReference = FirebaseDatabase.instance.ref();
  final snapshot = await databaseReference.child("questions").get();

  // Convert snapshot to a list
  try {
    String encoded = json.encode(snapshot.value.toString());
    Map<String, dynamic> map = json.decode(encoded);
    List<dynamic> data = map["questions"];
    print(data[0]);
  } catch (e) {
    developer.log(e.toString());
  }

  /*
  if (snapshot.exists) {
    developer.log(snapshot.value.toString());
  }
  */
}
*/

/*
Widget _List() {
  return Expanded(
    child: FirebaseAnimatedList(
      query: getData(),
      itemBuilder: (context, snapshot, animation, index) {
        // ignore: avoid_unnecessary_containers
        final json = snapshot.value as Map<dynamic, dynamic>;


  )
}

*/
