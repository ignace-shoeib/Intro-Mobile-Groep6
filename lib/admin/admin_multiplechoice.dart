import 'package:exam_app/message_box.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../questions/load_questions.dart';

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
                  // OPTIONS INPUT
                  //
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: optionsController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            "Opties (opties gescheiden door een puntkomma)",
                        labelText:
                            "Opties (opties gescheiden door een puntkomma)",
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
                      controller: answerController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Correct Antwoord",
                        labelText: "Correct Antwoord",
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
                          List<String> options =
                              optionsController.text.split(";");
                          if (options.contains(answerController.text)) {
                            var optionsMap = <int, String>{};
                            for (int i = 0; i < options.length; i++) {
                              optionsMap[i] = options[i];
                            }
                            DatabaseReference ref =
                                FirebaseDatabase.instance.ref("questions");
                            await ref.push().set({
                              "type": "multiple choice",
                              "question": questionController.text,
                              "options": optionsMap,
                              "answer": answerController.text
                            });
                            await LoadQuestions.loadQuestions();
                            MessageBox.showMessageBox(
                                "Vraag toegevoegd",
                                "Je hebt je vraag met succes toegevoegd!",
                                context);
                          } else {
                            MessageBox.showMessageBox(
                                "Fout",
                                "Je optieslijst bevat niet het juiste antwoord!",
                                context);
                          }
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: const Text("Vraag opslaan"),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
