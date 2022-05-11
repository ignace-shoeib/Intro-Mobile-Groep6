import 'package:exam_app/my_app.dart';
import 'package:flutter/material.dart';
import 'admin_form.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ),
          );
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              title: const Text("Gradeaid"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                AdminLoginTitle(),
                SizedBox(height: 20),
                AdminLogin(),
                LoginAsStudentButton(),
              ],
            )));
  }
}
