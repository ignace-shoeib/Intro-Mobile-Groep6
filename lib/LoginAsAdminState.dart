import 'package:exam_app/AdminLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginAsAdminButton.dart';

class LoginAsAdminState extends State<LoginAsAdminButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AdminLoginPage()));
            },
            child: Text("Inloggen als admin"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
  }
}
