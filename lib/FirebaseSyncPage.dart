import 'package:flutter/material.dart';

class FirebaseSync extends StatelessWidget {
  const FirebaseSync({Key? key}) : super(key: key);

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
            //const SizedBox(height: ),
            Center(child: FirebaseSyncButton()),
          ],
        ));
  }
}

class FirebaseSyncButton extends StatefulWidget {
  const FirebaseSyncButton({Key? key}) : super(key: key);

  @override
  State<FirebaseSyncButton> createState() => FirebaseSyncState();
}

class FirebaseSyncState extends State<FirebaseSyncButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: const Text("Synchroniseer"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
