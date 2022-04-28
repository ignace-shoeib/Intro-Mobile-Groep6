import 'package:flutter/material.dart';

class FirebaseSync extends StatelessWidget {
  const FirebaseSync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          title: Text("Gradeaid"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SizedBox(height: ),
            Center(child: FirebaseSyncButton()),
          ],
        ));
  }
}

class FirebaseSyncButton extends StatefulWidget {
  @override
  State<FirebaseSyncButton> createState() => FirebaseSyncState();
}

class FirebaseSyncState extends State<FirebaseSyncButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: Text("Synchroniseer"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
