class AnswerBodyRes {
  String? id;
  String? answer;
  bool? isCorrect;
  int? score;
  AnswerBodyRes({this.id, this.answer, this.isCorrect, this.score});
  factory AnswerBodyRes.fromJson(dynamic json) {
    return AnswerBodyRes(
      id: json['_id'] as String,
      answer: json['answer'] as String,
      isCorrect: json['isCorrect'] as bool,
      score: json['score'] as int,
    );
  }
}
