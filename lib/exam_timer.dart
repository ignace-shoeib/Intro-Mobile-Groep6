import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class ExamTimer extends StatefulWidget {
  const ExamTimer({Key? key}) : super(key: key);

  @override
  State<ExamTimer> createState() => _ExamTimerState();
}

class Time {
  static int time = 0;
}

class _ExamTimerState extends State<ExamTimer> {
  static final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    onChange: (value) {},
    onChangeRawSecond: (value) => Time.time = value,
  );
  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
          stream: _stopWatchTimer.rawTime,
          initialData: 0,
          builder: (context, snap) {
            final value = snap.data;
            final displayTime = StopWatchTimer.getDisplayTime(value!);
            return Text(displayTime,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold));
          }),
    );
  }
}
