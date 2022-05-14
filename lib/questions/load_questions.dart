import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class LoadQuestions {
  static List<String> questions = [];
  static List<String> types = [];
  static Future<void> loadQuestions() async {
    questions = [];
    types = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("questions").get();
    var encoded = json.encode(snapshot.value);
    var encodedQuestions = json.decode(encoded);
    var questionMap = Map<String, dynamic>.from(encodedQuestions);
    for (var key in questionMap.keys) {
      var questionMap2 = Map<String, dynamic>.from(questionMap[key]);
      questions.add(questionMap2['question']);
      types.add(questionMap2['type']);
    }
  }
}
