// ignore_for_file: prefer_const_constructors
import 'package:exam_app/AdminHomePage.dart';
import 'package:exam_app/MyApp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLoginTitle extends StatelessWidget {
  const AdminLoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text("Inloggen als admin",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final adminMailController = TextEditingController();
  final adminPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            // MAIL INPUT
            //
            SizedBox(height: 20),
            TextFormField(
                controller: adminMailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "AP E-Mail",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color.fromARGB(80, 61, 61, 61),
                  filled: true,
                )),
            //
            // PASSWORD INPUT
            //
            SizedBox(height: 20),
            TextFormField(
                controller: adminPasswordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Wachtwoord",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color.fromARGB(80, 61, 61, 61),
                  filled: true,
                )),
            //
            //  LOGIN BUTTON
            //
            SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: TextButton(
                onPressed: () {
                  final FirebaseAuth _auth = FirebaseAuth.instance;
                  _auth
                      .signInWithEmailAndPassword(
                          email: adminMailController.text,
                          password: adminPasswordController.text)
                      .then((user) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AdminHomePage()));
                  }).catchError((error) {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Color.fromARGB(255, 22, 22, 22),
                              title: const Text('Fout bij aanmelden',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              content: const Text(
                                  'E-mail of wachtwoord is onjuist.',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ));
                  });
                },
                child: Text("Login"),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              ),
            )
          ],
        ),
      ));

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: adminMailController.text.trim(),
        password: adminPasswordController.text.trim());
  }
}

class LoginAsStudentButton extends StatefulWidget {
  const LoginAsStudentButton({Key? key}) : super(key: key);

  @override
  State<LoginAsStudentButton> createState() => LoginAsStudentState();
}

class LoginAsStudentState extends State<LoginAsStudentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
