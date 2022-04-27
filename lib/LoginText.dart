import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text("Student Login",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}
