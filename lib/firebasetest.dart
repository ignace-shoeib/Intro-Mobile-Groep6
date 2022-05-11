import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FireBaseTest extends StatefulWidget {
  const FireBaseTest({Key? key}) : super(key: key);

  @override
  _FireBaseTestState createState() => _FireBaseTestState();
}

class _FireBaseTestState extends State<FireBaseTest> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child("questions/-N1jJv2ZBBLhGzOzeDVJ/\"question\"");
    //final snapshot = await DatabaseReference.child("questions/-N1jJv2ZBBLhGzOzeDVJ").get();
    return Scaffold(
      appBar: AppBar(title: const Text("View Data")),
      body: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  tileColor: Colors.grey[400],
                  title: Text(
                    snapshot.value.toString(),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Future<String> getData() async {
  final databaseReference = FirebaseDatabase.instance.ref();
  final snapshot = await databaseReference
      .child("questions/-N1jJv2ZBBLhGzOzeDVJ/question")
      .get();

  /*
  if (snapshot.exists) {
    developer.log(snapshot.value.toString());
  }
  */
  return snapshot.value.toString();
}
