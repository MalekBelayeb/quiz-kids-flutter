import 'package:quiz_flutter/data/models/Answer.dart';

class QuestionBodyRes {
  String? id;
  String? question;
  List<AnswerBodyRes>? answers;

  QuestionBodyRes({this.id, this.question, this.answers});
  factory QuestionBodyRes.fromJson(dynamic json) {
    return QuestionBodyRes(
        id: json['_id'] as String,
        question: json['question'] as String,
        answers: List<AnswerBodyRes>.from((json['answers'] as List<dynamic>)
            .map((e) => AnswerBodyRes.fromJson(e))).toList());
  }
}
