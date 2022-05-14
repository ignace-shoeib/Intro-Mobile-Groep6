import 'package:exam_app/questions/load_questions.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LoadStudents.students = await LoadStudents.loadStudentsFirstTime();
  LoadStudents.students.sort((a, b) => a.studentNr!.compareTo(b.studentNr!));
  await LoadQuestions.loadQuestions();
  runApp(const MyApp());
}
