import 'package:exam_app/load_students.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = LoadStudents.students.first.toString();
  List<String> studentStrings =
      LoadStudents.students.map((student) => student.toString()).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 37, 37),
          borderRadius: BorderRadius.circular(2)),
      child: DropdownButton<String>(
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        value: dropdownValue,
        dropdownColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 16,
        underline: Container(
          height: 2,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: studentStrings.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
