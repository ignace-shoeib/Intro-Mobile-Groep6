import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginAsAdminButton.dart';

class LoginAsAdminState extends State<LoginAsAdminButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
            onPressed: () {},
            child: Text("Inloggen als admin"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}