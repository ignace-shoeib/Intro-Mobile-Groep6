import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = "s111000";

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
        dropdownColor: Color.fromARGB(255, 37, 37, 37),
        elevation: 16,
        underline: Container(
          height: 2,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          "s111000",
          "s222000",
          "s333000",
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
