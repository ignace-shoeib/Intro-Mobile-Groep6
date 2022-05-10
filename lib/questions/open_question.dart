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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['question'] = this.question;
    data['status'] = this.status;
    return data;
  }
}
