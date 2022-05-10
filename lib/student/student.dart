import 'package:exam_app/questions/code_question.dart';
import 'package:exam_app/questions/multiplechoice_question.dart';
import 'package:exam_app/questions/open_question.dart';

class Student {
  String? studentNr;
  String? studentName;
  String? examStatus;
  String? location;
  List<OpenQuestion>? openQuestions;
  List<MultipleChoiceQuestion>? multipleChoiceQuestions;
  List<CodeQuestion>? codeQuestions;

  Student({
    this.studentNr,
    this.studentName,
    this.examStatus,
    this.location,
    this.openQuestions,
    this.multipleChoiceQuestions,
    this.codeQuestions,
  });

  Student.fromJson(Map<String, dynamic> json) {
    studentNr = json['studentNr'];
    studentName = json['studentName'];
    examStatus = json['examStatus'];
    location = json['location'];
    if (json['openQuestions'] != null) {
      openQuestions = <OpenQuestion>[];
      json['openQuestions'].forEach((v) {
        openQuestions?.add(new OpenQuestion.fromJson(v));
      });
    }
    if (json['multipleChoiceQuestions'] != null) {
      multipleChoiceQuestions = <MultipleChoiceQuestion>[];
      json['multipleChoiceQuestions'].forEach((v) {
        multipleChoiceQuestions?.add(new MultipleChoiceQuestion.fromJson(v));
      });
    }
    if (json['codeQuestions'] != null) {
      codeQuestions = <CodeQuestion>[];
      json['codeQuestions'].forEach((v) {
        codeQuestions?.add(new CodeQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentNr'] = this.studentNr;
    data['studentName'] = this.studentName;
    data['examStatus'] = this.examStatus;
    data['location'] = this.location;
    if (this.openQuestions != null) {
      data['openQuestions'] =
          this.openQuestions?.map((v) => v.toJson()).toList();
    }
    if (this.multipleChoiceQuestions != null) {
      data['multipleChoiceQuestions'] =
          this.multipleChoiceQuestions?.map((v) => v.toJson()).toList();
    }
    if (this.codeQuestions != null) {
      data['codeQuestions'] =
          this.codeQuestions?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  //const Student(this.studentNr, this.studentName);
  @override
  String toString() => "$studentNr;$studentName";
}
