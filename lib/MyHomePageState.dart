import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'LoginText.dart';
import 'LoginButton.dart';
import 'LoginAsAdminButton.dart';
import 'DropDownButton.dart';

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LoginText(),
            const SizedBox(height: 20),
            const DropDownButton(),
            const SizedBox(height: 20),
            LoginButton(),
            const LoginAsAdminButton(),

            //
          ],
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
