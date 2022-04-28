import 'package:exam_app/DropDownButton.dart';
import 'package:exam_app/PasswordInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AdminForm.dart';

class AdminLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          title: Text("Gradeaid"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AdminLoginTitle(),
            const SizedBox(height: 20),
            AdminMailInput(),
            const SizedBox(height: 5),
            PasswordInput(),
            const SizedBox(height: 20),
            AdminLoginButton(),
            LoginAsStudentButton(),
          ],
        ));
  }
}
