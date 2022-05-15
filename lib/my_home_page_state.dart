import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'login_text.dart';
import 'login_button.dart';
import 'admin/login_as_admin_button.dart';
import 'drop_down_button.dart';

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
          children: const [
            LoginText(),
            SizedBox(height: 20),
            DropDownButton(),
            SizedBox(height: 20),
            LoginButton(),
            LoginAsAdminButton(),
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
