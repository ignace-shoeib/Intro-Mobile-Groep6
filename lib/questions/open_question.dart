class OpenQuestion {
  String? score;
  String? question;
  String? status;

  OpenQuestion({this.score, this.question, this.status});

  OpenQuestion.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    question = json['question'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    data['question'] = question;
    data['status'] = status;
    return data;
  }
}
