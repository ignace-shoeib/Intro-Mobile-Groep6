class Question {
  String? questiontype;
  String? question;

  Question({this.questiontype, this.question});

  Question.fromJson(Map<String, dynamic> json) {
    questiontype = json['questiontype'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questiontype'] = this.questiontype;
    data['question'] = this.question;
    return data;
  }
}
