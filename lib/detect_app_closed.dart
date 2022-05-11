import 'package:flutter/material.dart';

class DetectAppClosed extends StatelessWidget {
  const DetectAppClosed({Key? key}) : super(key: key);

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
          children: [Center(child: LifecycleWatcher())],
        ));
  }
}

class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => _LifecycleWatcherState();
}

int countAppClosed = 0;

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lastLifecycleState == AppLifecycleState.resumed ||
        countAppClosed > 0) {
      countAppClosed++;
      return Text(countAppClosed.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 150, fontWeight: FontWeight.bold));
    }
    return Text('De applicatie is nog niet dicht gegaan.',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold));
  }
}

void main() {
  runApp(Center(child: LifecycleWatcher()));
}
