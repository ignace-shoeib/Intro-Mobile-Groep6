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
              const AdminLoginTitle(),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text('Beëindig examen'),
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Color.fromARGB(255, 22, 22, 22),
                              title: const Text(
                                  'Wilt u zeker het examen beëindigen?',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              /*content: const Text(
                                  'Gebruikersnaam of wachtwoord is onjuist',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),*/
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Nee'),
                                  child: const Text(
                                    'Nee',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () => Navigator.pop(context, 'Ja'),
                                  child: const Text(
                                    'Ja',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ));
                  },
                ),
              ))
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
