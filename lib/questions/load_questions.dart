import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class LoadQuestions {
  static late List<dynamic> listQuestions;
  static Future<void> loadQuestions() async {
    listQuestions = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child("questions").get();
    var encoded = json.encode(snapshot.value);
    var encodedQuestions = json.decode(encoded);
    var questionMap = Map<String, dynamic>.from(encodedQuestions);
    for (var key in questionMap.keys) {
      listQuestions.add(Map<String, dynamic>.from(questionMap[key]));
    }
  }
}
