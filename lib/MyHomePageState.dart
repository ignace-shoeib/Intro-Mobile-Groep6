import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyHomePage.dart';
import 'LoginText.dart';
import 'MailInput.dart';
import 'LoginButton.dart';
import 'LoginAsAdminButton.dart';
import 'DropDownButton.dart';

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            const SizedBox(height: 200),
            LoginText(),
            const SizedBox(height: 20),
            DropDownButton(),
            const SizedBox(height: 20),
            LoginButton(),
            LoginAsAdminButton(),

            //
          ],
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
