import 'package:exam_app/StudentStartExamPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginButton.dart';

class LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentStartExamPage()));
          },
          child: Text("Login"),
          style: redButtonStyle(),
        ));
  }

  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));
  }
}
