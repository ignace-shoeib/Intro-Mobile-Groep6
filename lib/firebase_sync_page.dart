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
            Center(child: StudentUploadButton()),
            Center(child: StudentDownloadButton())
          ],
        ));
  }
}

class StudentUploadButton extends StatefulWidget {
  const StudentUploadButton({Key? key}) : super(key: key);

  @override
  State<StudentUploadButton> createState() => StudentUploadState();
}

class StudentUploadState extends State<StudentUploadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: const Text("Upload studenten"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}

class StudentDownloadButton extends StatefulWidget {
  const StudentDownloadButton({Key? key}) : super(key: key);

  @override
  State<StudentDownloadButton> createState() => StudentDownloadState();
}

class StudentDownloadState extends State<StudentDownloadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
          onPressed: () {},
          child: const Text("Download studenten"),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
        ));
  }
}
