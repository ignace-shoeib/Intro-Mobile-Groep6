import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 400,
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "AP E-Mail",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
            )));
  }
}