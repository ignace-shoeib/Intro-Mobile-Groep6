import 'package:exam_app/admin/admin_studentadd.dart';
import 'package:exam_app/admin/admin_studentgradepage.dart';
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
              const SizedBox(height: 20),
              const Expanded(child: StudentTempList()),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      minimumSize: const Size(400, 35)),
                  child: const Text('Student toevoegen'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddStudentPage()));
                  },
                ),
              )),
              const TempStudentGradeButton()
            ]));
  }
}

// Temp for testing
class TempStudentGradeButton extends StatefulWidget {
  const TempStudentGradeButton({Key? key}) : super(key: key);

  @override
  State<TempStudentGradeButton> createState() => TempStudentGradeState();
}

class TempStudentGradeState extends State<TempStudentGradeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminStudentGrade()));
            },
            child: const Text("Temp button naar student grade"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            )));
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

class StudentTempList extends StatefulWidget {
  const StudentTempList({Key? key}) : super(key: key);

  @override
  State<StudentTempList> createState() => StudentTempListState();
}

class StudentTempListState extends State<StudentTempList> {
  List<String> vragen = [
    "s1111",
    "s2222",
    "s4444",
    "s5555",
    "s6666",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: vragen.length,
          itemBuilder: (context, index) {
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
