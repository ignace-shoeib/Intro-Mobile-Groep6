import 'package:flutter/material.dart';

class AdminPasswordChange extends StatelessWidget {
  const AdminPasswordChange({Key? key}) : super(key: key);

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
            Center(child: AdminPasswordChangeTitle()),
            const SizedBox(height: 20),
            Center(child: PasswordChangeInput()),
            const SizedBox(height: 20),
            ConfirmPasswordChangeButton(),
          ],
        ));
  }
}

class AdminPasswordChangeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text("Nieuw Wachtwoord",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class PasswordChangeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 400,
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nieuw wachtwoord",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
            )));
  }
}

class ConfirmPasswordChangeButton extends StatefulWidget {
  @override
  State<ConfirmPasswordChangeButton> createState() =>
      ConfirmPasswordChangeButtonState();
}

class ConfirmPasswordChangeButtonState
    extends State<ConfirmPasswordChangeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Bevestigen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
