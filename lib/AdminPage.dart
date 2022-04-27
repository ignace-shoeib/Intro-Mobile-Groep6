import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AdminForm.dart';

class AdminPage extends StatelessWidget {
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
          ],
        ));
  }
}
