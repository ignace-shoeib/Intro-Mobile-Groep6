import 'dart:io';
import 'package:csv/csv.dart';
import 'package:exam_app/admin/admin_studentlistpage.dart';
import 'package:exam_app/message_box.dart';
import 'package:exam_app/student/load_students.dart';
import 'package:exam_app/student/student.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentListPage(),
            ),
          );
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              title: const Text("Gradeaid"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(child: AddStudentTitle()),
                SizedBox(height: 20),
                AddStudentInput(),
                SizedBox(height: 20),
                AddStudentButton(),
              ],
            )));
  }
}

class AddStudentTitle extends StatelessWidget {
  const AddStudentTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Student toevoegen (studentnr;studentnaam)",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class AddStudentInput extends StatelessWidget {
  static final addStudentController = TextEditingController();

  const AddStudentInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 400,
            child: TextField(
              controller: addStudentController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nieuwe student (studentnr;studentnaam)",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(80, 61, 61, 61),
                filled: true,
              ),
              maxLines: 10,
            )));
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
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {
            addStudent(context);
          },
          child: const Text("Bevestigen"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

void addStudent(BuildContext context) async {
  try {
    final newStudent = Student();
    List<String> splitString =
        AddStudentInput.addStudentController.text.split(';');
    newStudent.studentNr = splitString[0];
    newStudent.studentName = splitString[1];
    LoadStudents.students.add(newStudent);
    LoadStudents.students.sort((a, b) => a.studentNr!.compareTo(b.studentNr!));

    List<List<dynamic>> csvData = [LoadStudents.students];
    final csv = CsvCodec();
    final csvString = csv.encoder.convert(csvData).replaceAll(',', "\n");
    var file = await _localFile;
    file.writeAsString(csvString);
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: const Color.fromARGB(255, 22, 22, 22),
              title: const Text("Student toegevoegd",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              content: Text("Student ${newStudent.studentName} is toegevoegd",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255))),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ));
  } catch (e) {
    MessageBox.showMessageBox(
        "Fout",
        "Fout, studentennummer en studentennaam is slecht geformateerd.",
        context);
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data_copy.csv');
}
