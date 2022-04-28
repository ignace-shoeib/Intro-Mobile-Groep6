import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// INPUT FIELD FOR PASSWORD
class AdminPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: const TextField(
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
