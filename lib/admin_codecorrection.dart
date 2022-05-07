import 'package:flutter/material.dart';

class CodeCorrectionPage extends StatefulWidget {
  const CodeCorrectionPage({Key? key}) : super(key: key);

  @override
  State<CodeCorrectionPage> createState() => CodeCorrectionPageState();
}

class CodeCorrectionPageState extends State<CodeCorrectionPage> {
  final correctCodeController = TextEditingController();
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
                          controller: correctCodeController,
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
                  onPressed: () {},
                  child: const Text("Vraag opslaan"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                ))
          ],
        ));
  }
}
