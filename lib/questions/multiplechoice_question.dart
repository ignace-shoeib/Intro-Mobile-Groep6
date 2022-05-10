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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['question'] = this.question;
    data['answers'] = this.answers;
    data['status'] = this.status;
    return data;
  }
}
