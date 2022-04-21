import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginButton.dart';

class LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Login"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}