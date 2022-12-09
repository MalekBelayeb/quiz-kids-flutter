import 'package:quiz_flutter/data/models/Answer.dart';
import 'package:quiz_flutter/data/models/Question.dart';
import 'package:quiz_flutter/data/models/QuizAttempt.dart';

class QuizCategoryBodyRes {
  String? id;
  String? name;
  String? image;
  QuizCategoryBodyRes({this.id, this.name, this.image});
  factory QuizCategoryBodyRes.fromJson(dynamic json) {
    return QuizCategoryBodyRes(
      id: json['_id'] as String,
      name: json['category'] as String,
      image: json['image'] as String,
    );
  }
}

class QuizBodyRes {
  String? id;
  String? name;
  String? description;
  QuizCategoryBodyRes? category;
  String? difficulty;
  String? image;

  List<QuestionBodyRes>? questions;

  QuizBodyRes(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.difficulty,
      this.questions,
      this.image});
  factory QuizBodyRes.fromJson(dynamic json) {
    return QuizBodyRes(
        id: json['_id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        category: QuizCategoryBodyRes.fromJson(json["category"]),
        difficulty: json['difficulty'] as String,
        image: json['image'] as String,
        questions: List<QuestionBodyRes>.from(
            (json['questions'] as List<dynamic>)
                .map((e) => QuestionBodyRes.fromJson(e))).toList());
  }
}

class GetQuizAttemptBodyRes {
  String? id;
  String? name;
  String? description;
  QuizCategoryBodyRes? category;
  String? difficulty;
  String? image;

  List<QuestionBodyRes>? questions;

  GetQuizAttemptBodyRes(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.difficulty,
      this.questions,
      this.image});

  factory GetQuizAttemptBodyRes.fromJson(dynamic json) {
    return GetQuizAttemptBodyRes(
        id: json['_id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        category: QuizCategoryBodyRes.fromJson(json["category"]),
        difficulty: json['difficulty'] as String,
        image: json['image'] as String,
        questions: List<QuestionBodyRes>.from(
            (json['questions'] as List<dynamic>)
                .map((e) => QuestionBodyRes.fromJson(e))).toList());
  }
}

class GetAllQuizSuccessRes {
  List<QuizBodyRes>? quizList;
  GetAllQuizSuccessRes({required this.quizList});
  factory GetAllQuizSuccessRes.fromJson(dynamic json) {
    return GetAllQuizSuccessRes(
        quizList: List<QuizBodyRes>.from((json['quiz'] as List<dynamic>)
            .map((e) => QuizBodyRes.fromJson(e))).toList());
  }
}
