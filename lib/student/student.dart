class Student {
  final String studentNr;
  final String studentName;
  const Student(this.studentNr, this.studentName);
  @override
  String toString() => "$studentNr;$studentName";
}
