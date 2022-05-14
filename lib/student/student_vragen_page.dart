import 'package:flutter/material.dart';

class StudentVragenPage extends StatelessWidget {
  const StudentVragenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              AdminLoginTitle(),
              SizedBox(height: 20),
              Expanded(child: StudentQuestionsList()),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: StopExamButton(),
              )),
              SizedBox(height: 50),
            ]));
  }
}

class AdminLoginTitle extends StatelessWidget {
  const AdminLoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Vragen",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class StopExamButton extends StatefulWidget {
  const StopExamButton({Key? key}) : super(key: key);

  @override
  State<StopExamButton> createState() => StopExamButtonState();
}

class StopExamButtonState extends State<StopExamButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.red)),
      child: const Text('Beëindig examen'),
      onPressed: () {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                  title: const Text('Wilt u zeker het examen beëindigen?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Nee'),
                      child: const Text(
                        'Nee',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: const Text(
                        'Ja',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ));
      },
    );
  }
}

class StudentQuestionsList extends StatefulWidget {
  const StudentQuestionsList({Key? key}) : super(key: key);

  @override
  State<StudentQuestionsList> createState() => StudentQuestionsListState();
}

class StudentQuestionsListState extends State<StudentQuestionsList> {
  List<String> vragen = [
    "Wat is jouw mama's verjaardag?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: vragen.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black54,
                title: Text(vragen[index]),
              ),
            );
          }),
    );
  }
}
