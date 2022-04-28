import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'LoginButton.dart';
import 'LoginAsAdminButton.dart';
import 'LoginText.dart';
import 'MailInput.dart';
import 'MyApp.dart';
import 'AdminPasswordInput.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
