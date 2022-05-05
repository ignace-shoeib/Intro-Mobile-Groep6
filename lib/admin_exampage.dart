import 'package:flutter/material.dart';

class ButtonCodeCorrection extends StatefulWidget {
  const ButtonCodeCorrection({Key? key}) : super(key: key);

  @override
  State<ButtonCodeCorrection> createState() => ButtonCodeCorrectionState();
}

class ButtonCodeCorrectionState extends State<ButtonCodeCorrection> {
  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: const Text("Code Correctie"),
          style: redButtonStyle(),
        ));
  }
}

class ButtonMultipleChoice extends StatefulWidget {
  const ButtonMultipleChoice({Key? key}) : super(key: key);

  @override
  State<ButtonMultipleChoice> createState() => ButtonMultipleChoiceState();
}

class ButtonMultipleChoiceState extends State<ButtonMultipleChoice> {
  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: const Text("Code Correctie"),
          style: redButtonStyle(),
        ));
  }
}

class ButtonOpenVraag extends StatefulWidget {
  const ButtonOpenVraag({Key? key}) : super(key: key);

  @override
  State<ButtonOpenVraag> createState() => ButtonOpenVraagState();
}

class ButtonOpenVraagState extends State<ButtonOpenVraag> {
  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: const Text("Open vraag"),
          style: redButtonStyle(),
        ));
  }
}

class AdminExamPage extends StatefulWidget {
  const AdminExamPage({Key? key}) : super(key: key);

  @override
  AdminExamPageState createState() => AdminExamPageState();
}

class AdminExamPageState extends State<AdminExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: const Text("Multiple choice"),
      ),
      body: Column(
        children: [
          //
          // COLUMN WITH BUTTONS
          //
          Column(
            children: const [
              Text("Voeg een vraag toe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              ButtonCodeCorrection(),
              ButtonMultipleChoice(),
              ButtonOpenVraag(),
            ],
          ),
          //
          // COLUMN "HUIDIGE VRAGEN"
          //
          Container()
        ],
      ),
    );
  }
}
