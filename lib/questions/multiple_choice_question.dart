class MultipleChoiceQuestion {
  String? score;
  String? question;
  List<String>? answers;
  String? status;

  MultipleChoiceQuestion({this.score, this.answers, this.status});

  MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    question = json['question'];
    answers = json['answers'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    data['question'] = question;
    data['answers'] = answers;
    data['status'] = status;
    return data;
  }
}
