import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class FireBaseTestTwo extends StatefulWidget {
  const FireBaseTestTwo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FireBaseTestTwoState();
}

class FireBaseTestTwoState extends State<FireBaseTestTwo> {
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("View Data")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final ref = FirebaseDatabase.instance.ref();
                    final snapshot = await ref.child("questions").get();
                    var encoded = json.encode(snapshot.value);
                    var encodedQuestions = json.decode(encoded);
                    var test = Map<String, dynamic>.from(encodedQuestions);
                    for (var key in test.keys) {
                      var lol = Map<String, dynamic>.from(test[key]);
                      for (var key2 in lol.keys) {
                        print(key2 + ": " + lol[key2].toString());
                      }
                    }
                  },
                  child: const Text("Test")),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await Geolocator.requestPermission();
                      var position = Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.best,
                          forceAndroidLocationManager: true);
                      print(
                          await position.timeout(const Duration(seconds: 10)));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text("Test2")),
            ],
          ),
        ));
  }
}
/*
Future<void> getData() async {
  final databaseReference = FirebaseDatabase.instance.ref();
  final snapshot = await databaseReference.child("questions").get();

  // Convert snapshot to a list
  try {
    String encoded = json.encode(snapshot.value.toString());
    Map<String, dynamic> map = json.decode(encoded);
    List<dynamic> data = map["questions"];
    print(data[0]);
  } catch (e) {
    developer.log(e.toString());
  }

  /*
  if (snapshot.exists) {
    developer.log(snapshot.value.toString());
  }
  */
}
*/

/*
Widget _List() {
  return Expanded(
    child: FirebaseAnimatedList(
      query: getData(),
      itemBuilder: (context, snapshot, animation, index) {
        // ignore: avoid_unnecessary_containers
        final json = snapshot.value as Map<dynamic, dynamic>;


  )
}

*/
