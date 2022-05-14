import 'package:flutter/material.dart';
import 'dart:async';

class ClockWidget extends StatefulWidget {
  @override
  ClockWidgetState createState() => ClockWidgetState();
}

class ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;
  int _secondCount = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        this._secondCount += 1;
      });
    });
  }

  Widget build(BuildContext context) {
    print("${_secondCount}");
    return Text(
      "${_secondCount}",
      style: TextStyle(fontSize: 75, color: Color.fromRGBO(30, 144, 255, 1)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
