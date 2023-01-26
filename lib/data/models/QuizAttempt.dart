import 'dart:ffi';

import 'package:quiz_flutter/data/models/Question.dart';
import 'package:quiz_flutter/data/models/Quiz.dart';

class CreateQuizAttemptBodyReq {
  String? quizId;
  String? userId;

  CreateQuizAttemptBodyReq({this.quizId, this.userId});

  Map<String, dynamic> toJson() {
    return {
      "quizId": quizId,
      "userId": userId,
    };
  }
}

class finishQuizAttemptBodyReq {
  String? quizAttemptId;

  finishQuizAttemptBodyReq({this.quizAttemptId});

  Map<String, dynamic> toJson() {
    return {
      "quizAttemptId": quizAttemptId,
    };
  }
}

class addAnswerAttemptBodyReq {
  String? questionId;
  String? userId;
  String? quizAttemptId;
  String? userAnswer;
  addAnswerAttemptBodyReq(
      {this.questionId, this.userId, this.quizAttemptId, this.userAnswer});

  Map<String, dynamic> toJson() {
    return {
      "questionId": questionId,
      "userId": userId,
      "quizAttemptId": quizAttemptId,
      "userAnswer": this.userAnswer
    };
  }
}

class QuizAttemptBodyRes {
  String? id;
  String? quiz;
  String? user;
  bool? alreadyPlayed;

  QuizAttemptBodyRes({this.id, this.quiz, this.user, this.alreadyPlayed});

  factory QuizAttemptBodyRes.fromJson(dynamic json) {
    return QuizAttemptBodyRes(
        id: json['id'] as String,
        quiz: json['quiz'] as String,
        user: json['user'] as String,
        alreadyPlayed: json['alreadyPlayed'] as bool);
  }
}

class AnswerAttemptBodyRes {
  bool? success;
  String? message;

  AnswerAttemptBodyRes({
    this.success,
    this.message,
  });

  factory AnswerAttemptBodyRes.fromJson(dynamic json) {
    return AnswerAttemptBodyRes(
        success: json['success'] as bool, message: json['message'] as String);
  }
}

class GetAllQuizAttemptSuccessRes {
  List<AllQuestionsAttemptBodyRes>? quizList;
  GetAllQuizAttemptSuccessRes({required this.quizList});
  factory GetAllQuizAttemptSuccessRes.fromJson(dynamic json) {
    return GetAllQuizAttemptSuccessRes(
        quizList: List<AllQuestionsAttemptBodyRes>.from(
            (json['attempts'] as List<dynamic>)
                .map((e) => AllQuestionsAttemptBodyRes.fromJson(e))).toList());
  }
}

class AllQuestionsAttemptBodyRes {
  List<QuestionAttemptBodyRes> questions;
  OriginalQuizAttemptBodyRes? quiz;
  AllQuestionsAttemptBodyRes({required this.questions, this.quiz});
  factory AllQuestionsAttemptBodyRes.fromJson(dynamic json) {
    return AllQuestionsAttemptBodyRes(
        quiz: OriginalQuizAttemptBodyRes.fromJson(json["quiz"]),
        questions: List<QuestionAttemptBodyRes>.from(
            (json['questions'] as List<dynamic>)
                .map((e) => QuestionAttemptBodyRes.fromJson(e))).toList());
  }
}

class QuestionAttemptBodyRes {
  String? id;
  String? user;
  String? userAnswer;
  QuestionBodyRes? question;

  QuestionAttemptBodyRes({this.id, this.user, this.userAnswer, this.question});

  factory QuestionAttemptBodyRes.fromJson(dynamic json) {
    return QuestionAttemptBodyRes(
        id: json['_id'] as String,
        user: json['user'] as String,
        userAnswer: json['userAnswer'] as String,
        question: QuestionBodyRes.fromJson(json['question']));
  }
}

class OriginalQuizAttemptBodyRes {
  String? id;
  String? name;
  String? description;
  QuizCategoryBodyRes? category;
  String? difficulty;
  String? image;

  OriginalQuizAttemptBodyRes(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.difficulty,
      this.image});
  factory OriginalQuizAttemptBodyRes.fromJson(dynamic json) {
    return OriginalQuizAttemptBodyRes(
        id: json['_id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        category: QuizCategoryBodyRes.fromJson(json["category"]),
        difficulty: json['difficulty'] as String,
        image: json['image'] as String);
  }
}
