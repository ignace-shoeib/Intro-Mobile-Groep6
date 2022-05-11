import 'package:exam_app/questions/code_question.dart';
import 'package:exam_app/questions/multiplechoice_question.dart';
import 'package:exam_app/questions/open_question.dart';

class Student {
  String? studentNr;
  String? studentName;
  String? examStatus;
  String? location;
  double? score;
  List<OpenQuestion>? openQuestions;
  List<MultipleChoiceQuestion>? multipleChoiceQuestions;
  List<CodeQuestion>? codeQuestions;

  Student({
    this.studentNr,
    this.studentName,
    this.examStatus,
    this.location,
    this.score,
    this.openQuestions,
    this.multipleChoiceQuestions,
    this.codeQuestions,
  });

  Student.fromJson(Map<String, dynamic> json) {
    studentNr = json['studentNr'];
    studentName = json['studentName'];
    examStatus = json['examStatus'];
    location = json['location'];
    score = json['score'];
    if (json['openQuestions'] != null) {
      openQuestions = <OpenQuestion>[];
      json['openQuestions'].forEach((v) {
        openQuestions?.add(OpenQuestion.fromJson(v));
      });
    }
    if (json['multipleChoiceQuestions'] != null) {
      multipleChoiceQuestions = <MultipleChoiceQuestion>[];
      json['multipleChoiceQuestions'].forEach((v) {
        multipleChoiceQuestions?.add(MultipleChoiceQuestion.fromJson(v));
      });
    }
    if (json['codeQuestions'] != null) {
      codeQuestions = <CodeQuestion>[];
      json['codeQuestions'].forEach((v) {
        codeQuestions?.add(CodeQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentNr'] = studentNr;
    data['studentName'] = studentName;
    data['examStatus'] = examStatus;
    data['location'] = location;
    data['score'] = score;
    if (openQuestions != null) {
      data['openQuestions'] = openQuestions?.map((v) => v.toJson()).toList();
    }
    if (multipleChoiceQuestions != null) {
      data['multipleChoiceQuestions'] =
          multipleChoiceQuestions?.map((v) => v.toJson()).toList();
    }
    if (codeQuestions != null) {
      data['codeQuestions'] = codeQuestions?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  //const Student(this.studentNr, this.studentName);
  @override
  String toString() => "$studentNr;$studentName";
}
