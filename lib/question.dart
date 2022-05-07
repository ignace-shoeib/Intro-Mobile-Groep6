class Question {
  String? questiontype;
  String? question;

  Question({this.questiontype, this.question});

  Question.fromJson(Map<String, dynamic> json) {
    questiontype = json['questiontype'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questiontype'] = questiontype;
    data['question'] = question;
    return data;
  }
}
