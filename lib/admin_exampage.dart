import 'package:exam_app/admin_multiplechoice.dart';
import 'package:exam_app/admin_questionslist.dart';
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
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MultipleChoicePage()));
          },
          child: const Text("Multiple Choice"),
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

class ButtonVragenBekijken extends StatefulWidget {
  const ButtonVragenBekijken({Key? key}) : super(key: key);

  @override
  State<ButtonVragenBekijken> createState() => ButtonVragenBekijkenState();
}

class ButtonVragenBekijkenState extends State<ButtonVragenBekijken> {
  ButtonStyle redButtonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.green));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const QuestionsListPage()));
          },
          child: const Text("Vragen Bekijken"),
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
        title: const Text("Gradeaid"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Voeg een vraag toe",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ButtonCodeCorrection(),
            ButtonMultipleChoice(),
            ButtonOpenVraag(),
            ButtonVragenBekijken()
          ],
        ),
      ),
    );
  }
}
