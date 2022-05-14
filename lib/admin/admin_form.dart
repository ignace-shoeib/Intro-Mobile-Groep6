import 'package:exam_app/admin/admin_home_page.dart';
import 'package:exam_app/message_box.dart';
import 'package:exam_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLoginTitle extends StatelessWidget {
  const AdminLoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Inloggen als admin",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final adminMailController = TextEditingController();
  final adminPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            // MAIL INPUT
            //
            const SizedBox(height: 20),
            TextFormField(
                controller: adminMailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
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
            const SizedBox(height: 20),
            TextFormField(
                controller: adminPasswordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Wachtwoord",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color.fromARGB(80, 61, 61, 61),
                  filled: true,
                )),
            //
            //  LOGIN BUTTON
            //
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: TextButton(
                onPressed: () async {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  try {
                    await auth
                        .signInWithEmailAndPassword(
                            email: adminMailController.text,
                            password: adminPasswordController.text)
                        .then((user) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminHomePage()));
                    }).catchError((error) {
                      MessageBox.showMessageBox('Fout bij aanmelden',
                          'E-mail of wachtwoord is onjuist.', context);
                    });
                  } catch (_) {}
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text("Login"),
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
                  .push(MaterialPageRoute(builder: (context) => const MyApp()));
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: const Text("Inloggen als Student")));
  }
}
