import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/controller/QuizController.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

class QuizFinish extends StatefulWidget {
  static String tag = '/QuizWelcome';

  int points;
  String? quizAttemptId;
  QuizFinish({this.points = 0, required this.quizAttemptId});

  @override
  _QuizFinishState createState() => _QuizFinishState();
}

class _QuizFinishState extends State<QuizFinish> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(children: [
            Column(children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Column(children: [
                    commonCacheImageWidget(
                      "images/quiz/quiz.png",
                    ),
                  ])),
              Container(
                  margin: EdgeInsets.fromLTRB(60, 90, 60, 0),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              quiz_colorPrimary),
                        ))
                      : quizButton(
                          textContent: "Obtenez mes ${widget.points} points",
                          onPressed: () {
                            setState(
                              () {
                                isLoading = true;
                                QuizController.instance
                                    .finishQuiz(widget.quizAttemptId ?? "")
                                    .then(
                                  (value) {
                                    isLoading = false;
                                    QuizDashboard().launch(context);
                                  },
                                );
                              },
                            );
                          }))
            ]),
          ]),
        )));
  }
}
