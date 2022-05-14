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
          children: const [Center(child: LifecycleWatcher())],
        ));
  }
}

class LifecycleWatcher extends StatefulWidget {
  const LifecycleWatcher({Key? key}) : super(key: key);

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
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
    switch (_lastLifecycleState) {
      case AppLifecycleState.inactive:
        addToTimedLeftCounter();
        break;
      case AppLifecycleState.paused:
        addToTimedLeftCounter();
        break;
      case AppLifecycleState.detached:
        addToTimedLeftCounter();
        break;
      default:
    }

    return Text(countAppClosed.toString(),
        style: const TextStyle(
            color: Colors.white, fontSize: 150, fontWeight: FontWeight.bold));

    /*if (_lastLifecycleState == AppLifecycleState.inactive ||
        _lastLifecycleState == AppLifecycleState.paused ||
        _lastLifecycleState == AppLifecycleState.detached ||
        countAppClosed > 0) {
      countAppClosed++;
      return Text(countAppClosed.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 150, fontWeight: FontWeight.bold));
    } else {
      return const Text('De applicatie is nog niet dicht gegaan.',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold));
    }*/
  }
}

String addToTimedLeftCounter() {
  countAppClosed++;
  return countAppClosed.toString();
}

void main() {
  runApp(const Center(child: LifecycleWatcher()));
}
