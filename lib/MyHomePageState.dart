import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyHomePage.dart';
import 'LoginText.dart';
import 'MailInput.dart';
import 'LoginButton.dart';
import 'LoginAsAdminButton.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginText(),
            const SizedBox(height: 20),
            MailInput(),
            const SizedBox(height: 20),
            LoginButton(),
            LoginAsAdminButton(),
          ],
        ));
  }
}

final studentlist = TextEditingController();

List<String> students = ["s111000, s222000, s333000"];
