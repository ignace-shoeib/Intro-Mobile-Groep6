import 'package:flutter/material.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({Key? key}) : super(key: key);

  @override
  State<MultipleChoicePage> createState() => MultipleChoicePageState();
}

class MultipleChoicePageState extends State<MultipleChoicePage> {
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //
                  // QUESTION INPUT
                  //
                  TextFormField(
                      controller: questionController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Vraag",
                        labelText: "Vraag",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Color.fromARGB(80, 61, 61, 61),
                        filled: true,
                      )),
                  //
                  // ANSWER INPUT
                  //
                  TextFormField(
                      controller: answerController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Answer",
                        labelText: "Answer",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Color.fromARGB(80, 61, 61, 61),
                        filled: true,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
