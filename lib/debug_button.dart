import 'package:exam_app/firebasetest.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'firebasetest.dart';

class DebugButton extends StatefulWidget {
  const DebugButton({Key? key}) : super(key: key);

  @override
  State<DebugButton> createState() => DebugButtonState();
}

class DebugButtonState extends State<DebugButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FireBaseTest()));
          },
          child: const Text("Debug"),
          style: redButtonStyle(),
        ));
  }

  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.green));
  }
}
