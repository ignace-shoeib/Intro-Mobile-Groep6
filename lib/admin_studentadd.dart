import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(child: AddStudentTitle()),
            SizedBox(height: 20),
            AddStudentInput(),
            SizedBox(height: 20),
            AddStudentButton(),
          ],
        ));
  }
}

class AddStudentTitle extends StatelessWidget {
  const AddStudentTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Student toevoegen",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class AddStudentInput extends StatelessWidget {
  static final addStudentController = TextEditingController();

  const AddStudentInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 400,
            child: TextField(
              obscureText: true,
              controller: addStudentController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nieuwe student",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
            )));
  }
}

class AddStudentButton extends StatefulWidget {
  const AddStudentButton({Key? key}) : super(key: key);

  @override
  State<AddStudentButton> createState() => AddStudentButtonState();
}

class AddStudentButtonState extends State<AddStudentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {
            if (AddStudentInput.addStudentController.text.length >= 6) {
              final _auth = FirebaseAuth.instance.currentUser;
              _auth?.updatePassword(AddStudentInput.addStudentController.text);
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                        title: const Text('Wachtwoord gewijzigd',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        content: const Text(
                            'Je wachtwoord is gewijzigd. Je kan nu inloggen met je nieuwe wachtwoord.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
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
            } else {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                        title: const Text('Fout bij wachtwoord wijzigen',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        content: const Text('Wachtwoord is te zwak.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
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
            }
          },
          child: const Text("Bevestigen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
