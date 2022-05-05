import 'package:flutter/material.dart';

// INPUT FIELD FOR PASSWORD
class AdminPasswordInput extends StatelessWidget {
  const AdminPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 400,
        child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Wachtwoord",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Color.fromARGB(80, 61, 61, 61),
              filled: true,
            )));
  }
}
