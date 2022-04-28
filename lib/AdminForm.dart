import 'package:exam_app/MyApp.dart';
import 'package:exam_app/MyHomePage.dart';
import 'package:exam_app/MyHomePageState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminLoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text("Inloggen als admin",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class AdminMailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 400,
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "AP E-Mail",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
            )));
  }
}

class AdminLoginButton extends StatefulWidget {
  @override
  State<AdminLoginButton> createState() => AdminLoginButtonState();
}

class AdminLoginButtonState extends State<AdminLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Login"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class LoginAsStudentButton extends StatefulWidget {
  @override
  State<LoginAsStudentButton> createState() => LoginAsStudentState();
}

class LoginAsStudentState extends State<LoginAsStudentButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
            child: Text("Inloggen als Student"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}
