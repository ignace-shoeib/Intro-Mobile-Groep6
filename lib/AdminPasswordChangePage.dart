import 'package:flutter/material.dart';

class AdminPasswordChange extends StatelessWidget {
  const AdminPasswordChange({Key? key}) : super(key: key);

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
            Center(child: AdminPasswordChangeTitle()),
            SizedBox(height: 20),
            Center(child: PasswordChangeInput()),
            SizedBox(height: 20),
            ConfirmPasswordChangeButton(),
          ],
        ));
  }
}

class AdminPasswordChangeTitle extends StatelessWidget {
  const AdminPasswordChangeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Nieuw Wachtwoord",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class PasswordChangeInput extends StatelessWidget {
  const PasswordChangeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            width: 400,
            child: TextField(
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
  const ConfirmPasswordChangeButton({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordChangeButton> createState() =>
      ConfirmPasswordChangeButtonState();
}

class ConfirmPasswordChangeButtonState
    extends State<ConfirmPasswordChangeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: const Text("Bevestigen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
