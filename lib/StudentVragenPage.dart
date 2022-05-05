import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

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
          children: [
            AdminLoginTitle(),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: EndExamPopUp(context),

                /*const Text('Beëindig examen'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            child: Container(
                                height: 300.0,
                                width: 300.0,
                                child: Column(
                                  children: <Widget>[
                                    const Text(
                                        'Wilt u zeker het examen beëindigen?'),
                                    TextButton(
                                      child: const Text('Ja'),
                                      onPressed: () {},
                                    ),
                                    TextButton(
                                      child: const Text('Nee'),
                                      onPressed: () {},
                                    )
                                  ],
                                )));
                      });*/
              ),
            ))
          ],
        ));
  }
}

EndExamPopUp(BuildContext context) => Container();

class AdminLoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: const Text("Vragen",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

/*
class StudentEndExamButton extends StatefulWidget {
  @override
  State<StudentEndExamButton> createState() => StudentEndExamButtonState();
}

class StudentEndExamButtonState extends State<StudentEndExamButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {
            openDialog();
          },
          child: Text("Examen Beëindigen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(),
    );*/
