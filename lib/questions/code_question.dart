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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['status'] = this.status;
    return data;
  }
}
