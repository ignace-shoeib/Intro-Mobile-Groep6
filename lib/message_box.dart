import 'package:flutter/material.dart';

class MessageBox {
  static void showMessageBox(
      String title, String message, BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 22, 22, 22),
              title: Text(title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255))),
              content: Text(message,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255))),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ));
  }
}
