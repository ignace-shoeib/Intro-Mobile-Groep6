import 'package:flutter/cupertino.dart';
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
    return SizedBox(
      width: 400,
      child: DropdownButton<String>(
        value: dropdownValue,
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
