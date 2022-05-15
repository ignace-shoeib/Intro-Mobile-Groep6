import 'package:exam_app/admin/admin_studentadd.dart';
import 'package:exam_app/admin/admin_studentgradepage.dart';
import 'package:flutter/material.dart';
import '../student/load_students.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({Key? key}) : super(key: key);

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
              StudentListTitle(),
              SizedBox(height: 20),
              Expanded(child: AdminListviewStudents()),
              Expanded(
                  flex: 0,
                  // Add student button
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: AddStudentButton()))
            ]));
  }
}

class StudentListTitle extends StatelessWidget {
  const StudentListTitle({Key? key}) : super(key: key);

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

class AdminListviewStudents extends StatelessWidget {
  const AdminListviewStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display students
      body: ListView.builder(
        itemCount: LoadStudents.students.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            onTap: () {
              LoadStudents.currentStudent =
                  LoadStudents.students[index].toString();

              print(
                  "${LoadStudents.students[index].studentNr!}, ${LoadStudents.students[index].studentName!}");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminStudentGrade()),
              );
            },
            tileColor: Colors.black54,
            title: Text(
                "${LoadStudents.students[index].studentNr!}, ${LoadStudents.students[index].studentName!}"),
          ));
        },
      ),
    );
  }
}

class AddStudentButton extends StatefulWidget {
  const AddStudentButton({Key? key}) : super(key: key);

  @override
  State<AddStudentButton> createState() => AddStudentButtonState();
}

class AddStudentButtonState extends State<AddStudentButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
          minimumSize: const Size(400, 35)),
      child: const Text('Student toevoegen'),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddStudentPage()));
      },
    );
  }
}
