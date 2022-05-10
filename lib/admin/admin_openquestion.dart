import 'package:exam_app/message_box.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OpenQuestionPage extends StatefulWidget {
  const OpenQuestionPage({Key? key}) : super(key: key);

  @override
  State<OpenQuestionPage> createState() => OpenQuestionPageState();
}

class OpenQuestionPageState extends State<OpenQuestionPage> {
  final questionController = TextEditingController();
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
                  const Text("Open vraag toevoegen",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  //
                  // Open vraag input
                  //
                  TextFormField(
                      controller: questionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
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
                  const SizedBox(height: 20),
                  SizedBox(
                      width: 400,
                      child: TextButton(
                        onPressed: () async {
                          DatabaseReference ref =
                              FirebaseDatabase.instance.ref("questions");
                          await ref.push().set({
                            "type": "open",
                            "question": questionController.text
                          });
                          MessageBox.showMessageBox(
                              "Vraag toegevoegd",
                              "Je hebt je vraag met succes toegevoegd!",
                              context);
                        },
                        child: const Text("Vraag opslaan"),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
