import 'package:exam_app/student/student_start_exam_page.dart';
import 'package:flutter/material.dart';
import 'login_button.dart';

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
          style: redButtonStyle(),
          child: const Text("Login"),
        ));
  }

  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));
  }
}
