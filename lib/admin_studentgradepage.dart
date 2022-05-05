import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminStudentGrade extends StatelessWidget {
  const AdminStudentGrade({Key? key}) : super(key: key);

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
            const AddStudentGradeTitle(),
            const SizedBox(height: 20),
            const Text('Punten', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            const Text('2',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
                child: Row(
              children: <Widget>[
                const ElevatedButton(onPressed: null, child: Text('Location')),
                const SizedBox(
                  width: 10,
                ),
                const ElevatedButton(onPressed: null, child: Text('Bewerken')),
                const SizedBox(
                  width: 10,
                ),
                const ElevatedButton(onPressed: null, child: Text('Bewerken')),
              ],
            ))
          ],
        ));
  }
}

class AddStudentGradeTitle extends StatelessWidget {
  const AddStudentGradeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Details [Place-holder]",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}
