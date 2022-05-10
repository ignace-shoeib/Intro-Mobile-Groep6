class CodeQuestion {
  String? score;
  String? question;
  String? answer;
  String? status;

  CodeQuestion({this.score, this.question, this.answer, this.status});

  CodeQuestion.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    question = json['question'];
    answer = json['answer'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    data['question'] = question;
    data['answer'] = answer;
    data['status'] = status;
    return data;
  }
}
