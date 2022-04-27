import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminLoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text("Inloggen als admin",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}
