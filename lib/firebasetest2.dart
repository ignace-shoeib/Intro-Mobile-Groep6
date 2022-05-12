import 'dart:convert';
import 'package:exam_app/message_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:http/http.dart' as http;

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
    MapController controller = MapController(initMapWithUserPosition: true);
    MarkerIcon markerIcon = const MarkerIcon(
        icon: Icon(
      Icons.location_history_rounded,
      color: Colors.red,
      size: 96,
    ));
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
                      var position = await controller.myLocation();
                      var address = await http.get(Uri.parse(
                          'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}'));
                      Map<String, dynamic> jsonAddress =
                          json.decode(address.body);
                      MessageBox.showMessageBox(
                          "succes",
                          "Latitude: ${position.latitude}\nLongitude: ${position.longitude}\nAddress: ${jsonAddress['display_name']}",
                          context);
                    } catch (e) {
                      MessageBox.showMessageBox("error", e.toString(), context);
                    }
                  },
                  child: const Text("Test2")),
              Flexible(
                  child: OSMFlutter(
                controller: controller,
                trackMyPosition: false,
                initZoom: 16,
                minZoomLevel: 2,
                maxZoomLevel: 19,
                stepZoom: 1.0,
                onMapIsReady: (ready) async {
                  controller.addMarker(await controller.myLocation(),
                      markerIcon: markerIcon);
                },
              ))
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
