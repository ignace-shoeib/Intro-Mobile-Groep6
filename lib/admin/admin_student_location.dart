import 'dart:convert';
import 'package:exam_app/student/load_students.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class StudentLocationPage extends StatelessWidget {
  const StudentLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapController controller = MapController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          title: const Text("Gradeaid"),
        ),
        body: Column(children: [
          const PageTitle(),
          const SizedBox(height: 10),
          const LocationText(),
          Flexible(
              child: OSMFlutter(
            controller: controller,
            trackMyPosition: false,
            initZoom: 16,
            minZoomLevel: 2,
            maxZoomLevel: 19,
            stepZoom: 1.0,
            onMapIsReady: (ready) async {
              String data = await GetData.getData();
              var jsonData = jsonDecode(data);
              double lat = jsonData["location"]["latitude"];
              double lon = jsonData["location"]["longitude"];
              GeoPoint geopoint = GeoPoint(latitude: lat, longitude: lon);
              await controller.changeLocation(geopoint);
            },
          ))
        ]));
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text("Locatie van ${LoadStudents.currentStudent}",
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
    );
  }
}

class GetData {
  static Future<String> getData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child("answers/${LoadStudents.currentStudent.trim()}/metadata")
        .get();
    var encoded = json.encode(snapshot.value);
    return encoded;
  }
}

class LocationText extends StatelessWidget {
  const LocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: GetData.getData(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        Align align = const Align();
        try {
          String data = snapshot.data!;
          var jsonData = jsonDecode(data);
          String location =
              "${jsonData["location"].toString().replaceAll('{', '').replaceAll('}', '')}\n${jsonData["address"]}";
          align = Align(
            alignment: Alignment.bottomCenter,
            child: Text(location,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          );
        } catch (e) {}
        return align;
      },
    );
  }
}
