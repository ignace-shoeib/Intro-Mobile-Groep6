import 'package:exam_app/StudentStartExamPage.dart';
import 'package:flutter/material.dart';
import 'LoginButton.dart';

class LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudentStartExamPage()));
          },
          child: const Text("Login"),
          style: redButtonStyle(),
        ));
  }

  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));
  }
}
