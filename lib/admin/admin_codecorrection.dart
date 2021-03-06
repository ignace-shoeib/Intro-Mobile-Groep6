import 'package:exam_app/message_box.dart';
import 'package:exam_app/questions/load_questions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CodeCorrectionPage extends StatefulWidget {
  const CodeCorrectionPage({Key? key}) : super(key: key);

  @override
  State<CodeCorrectionPage> createState() => CodeCorrectionPageState();
}

class CodeCorrectionPageState extends State<CodeCorrectionPage> {
  final answerController = TextEditingController();
  final questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        //
        // body
        //
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //
                // CODE VRAAG
                //
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text("Vraag toevoegen",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
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
                    ],
                  ),
                ),
                //
                // CORRECTE CODE
                //
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text("Correcte code",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextFormField(
                          controller: answerController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Correcte code",
                            labelText: "Correcte code",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Color.fromARGB(80, 61, 61, 61),
                            filled: true,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
                width: 400,
                child: TextButton(
                  onPressed: () async {
                    DatabaseReference ref =
                        FirebaseDatabase.instance.ref("questions");
                    await ref.push().set({
                      "type": "code correction",
                      "question": questionController.text,
                      "answer": answerController.text
                    });
                    await LoadQuestions.loadQuestions();
                    MessageBox.showMessageBox("Vraag toegevoegd",
                        "Je hebt je vraag met succes toegevoegd!", context);
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text("Vraag opslaan"),
                ))
          ],
        ));
  }
}
