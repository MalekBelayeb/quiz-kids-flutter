class QuizBodyRes {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  QuizBodyRes({this.id, this.firstName, this.lastName, this.phoneNumber});
  factory QuizBodyRes.fromJson(dynamic json) {
    return QuizBodyRes(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
}

class GetAllQuizSuccessRes {
  bool success;
  List<QuizBodyRes> quizList;
  GetAllQuizSuccessRes({required this.success, required this.quizList});
  factory GetAllQuizSuccessRes.fromJson(dynamic json) {
    return GetAllQuizSuccessRes(
        success: json['success'] as bool,
        quizList: List<QuizBodyRes>.from((json['quiz'] as List<dynamic>)
            .map((e) => QuizBodyRes.fromJson(e))).toList());
  }
}
