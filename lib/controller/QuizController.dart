import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/data/models/Quiz.dart';
import 'package:quiz_flutter/data/models/QuizAttempt.dart';
import 'package:quiz_flutter/data/service/QuizService.dart';

class UserQuizAnswer {
  String questionId;
  String answeId;

  UserQuizAnswer({required this.questionId, required this.answeId});
}

class QuizController {
  final QuizService quizService = QuizService();
  static final instance = QuizController();
  List<UserQuizAnswer?> userQuizAnswerList = [];

  Future<List<QuizBodyRes>?> getAllQuizByCat(String idCat) async {
    var res = await quizService.getAllQuizByCat(idCat);

    if (res is GetAllQuizSuccessRes) {
      return res.quizList?.toList();
    } else {
      return null;
    }
  }

  Future<List<QuizBodyRes>?> getAllQuiz() async {
    var res = await quizService.getAllQuiz();

    if (res is GetAllQuizSuccessRes) {
      return res.quizList?.toList();
    } else {
      return null;
    }
  }

  Future<List<AllQuestionsAttemptBodyRes>?> getAllQuizAttempt() async {
    var res = await quizService
        .getAllQuizAttempt(await sharedPreferences.getString('user') ?? "");

    if (res is GetAllQuizAttemptSuccessRes) {
      print(res.quizList?.length);
      return res.quizList?.toList();
    } else {
      return null;
    }
  }

  Future<QuizAttemptBodyRes?> createQuizAttempt(String quizId) async {
    var userId = await sharedPreferences.getString('user') ?? "";

    var res = await quizService.createQuizAttempt(
        CreateQuizAttemptBodyReq(quizId: quizId, userId: userId));

    if (res is QuizAttemptBodyRes) {
      return res;
    } else {
      return null;
    }
  }

  Future<AnswerAttemptBodyRes?> addAnswerAttempt(
      String quizId, String questionId, String answerId) async {
    var userId = await sharedPreferences.getString('user') ?? "";

    var res = await quizService.addAnswerAttempt(addAnswerAttemptBodyReq(
        questionId: questionId,
        quizAttemptId: quizId,
        userId: userId,
        userAnswer: answerId));

    if (res is AnswerAttemptBodyRes) {
      return res;
    } else {
      return null;
    }
  }

  Future<bool?> finishQuiz(String quizAttemptId) async {
    await quizService.finishQuizAttempt(
        finishQuizAttemptBodyReq(quizAttemptId: quizAttemptId));

    return true;
  }
}
