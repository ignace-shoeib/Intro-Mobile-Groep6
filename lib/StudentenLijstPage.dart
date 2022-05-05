import 'package:flutter/material.dart';

class StudentenLijstPage extends StatelessWidget {
  const StudentenLijstPage({Key? key}) : super(key: key);

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
              const StudentenLijstTitle(),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      minimumSize: const Size(400, 35)),
                  child: const Text('Student toevoegen'),
                  onPressed: () {},
                ),
              ))
            ]));
  }
}

class StudentenLijstTitle extends StatelessWidget {
  const StudentenLijstTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Studentenlijst",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}
