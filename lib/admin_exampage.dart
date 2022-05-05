import 'package:exam_app/AdminLoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCodeCorrection extends StatefulWidget {
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
    return Container(
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: Text("Code Correctie"),
          style: redButtonStyle(),
        ));
  }
}

class ButtonMultipleChoice extends StatefulWidget {
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
    return Container(
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: Text("Code Correctie"),
          style: redButtonStyle(),
        ));
  }
}

class ButtonOpenVraag extends StatefulWidget {
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
    return Container(
        width: 250,
        child: TextButton(
          onPressed: () {},
          child: Text("Open vraag"),
          style: redButtonStyle(),
        ));
  }
}

class AdminExamPage extends StatefulWidget {
  @override
  AdminExamPageState createState() => AdminExamPageState();
}

class AdminExamPageState extends State<AdminExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        title: Text("Multiple choice"),
      ),
      body: Column(
        children: [
          //
          // COLUMN WITH BUTTONS
          //
          Container(
            child: Column(
              children: [
                const Text("Voeg een vraag toe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                ButtonCodeCorrection(),
                ButtonMultipleChoice(),
                ButtonOpenVraag(),
              ],
            ),
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
