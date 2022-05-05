import 'package:flutter/material.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({Key? key}) : super(key: key);

  @override
  State<MultipleChoicePage> createState() => MultipleChoicePageState();
}

class MultipleChoicePageState extends State<MultipleChoicePage> {
  final questionController = TextEditingController();
  final optionsController = TextEditingController();
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
                  const Text("Vraag toevoegen",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  //
                  // OPTIONS (!! THIS REQUIRES MULTIPLE ANSWERS !! eg.: A: "Ja", B: "Nee")
                  //
                  TextFormField(
                      controller: questionController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
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
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: optionsController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Answer",
                        labelText: "Answer",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Color.fromARGB(80, 61, 61, 61),
                        filled: true,
                      )),
                  //
                  // OPLOSSING INPUT
                  //
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: answerController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Options",
                        labelText: "Options",
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
