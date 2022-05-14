import 'package:flutter/material.dart';
import 'dart:async';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  ClockWidgetState createState() => ClockWidgetState();
}

class ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;
  int _secondCount = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondCount += 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("$_secondCount");
    return Text(
      "$_secondCount",
      style:
          const TextStyle(fontSize: 75, color: Color.fromRGBO(30, 144, 255, 1)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
