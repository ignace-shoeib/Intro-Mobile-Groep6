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
          children: [
            const SizedBox(height: 200),
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
