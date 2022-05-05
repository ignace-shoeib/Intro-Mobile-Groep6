import 'package:flutter/material.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({Key? key}) : super(key: key);

  @override
  State<MultipleChoicePage> createState() => MultipleChoicePageState();
}

class MultipleChoicePageState extends State<MultipleChoicePage> {
  final vraagController = TextEditingController();
  final antwoordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(
          children: [
            TextFormField(
                controller: vraagController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "AP E-Mail",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color.fromARGB(80, 61, 61, 61),
                  filled: true,
                )),
          ],
        ));
  }
}
