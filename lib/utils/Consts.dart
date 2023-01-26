class Consts {
  static const baseUrl = "http://192.168.1.2:3000";

  static const loginUrl = baseUrl + "/api/v1/users/login";
  static const signupUrl = baseUrl + "/api/v1/users";
  static const getAllCategories = baseUrl + "/api/v1/category/get";

  static const getAllQuizByCat = baseUrl + "/api/v1/quiz/cat/";
  static const getAllQuiz = baseUrl + "/api/v1/quiz";
  static const getAllBadges = baseUrl + "/api/v1/badge/get";
  static const getUserById = baseUrl + "/api/v1/user/me/";

  static const addQuizAttempt = baseUrl + "/api/v1/quizAttempt/create";
  static const addAnswerAttempt = baseUrl + "/api/v1/quizAttempt/answer/create";
  static const finishQuiz = baseUrl + "/api/v1/quizAttempt/answer/finish";
  static const getAllQuizAttempt = baseUrl + "/api/v1/quizAttempt/get";
}
