import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/Screens/QuizSignIn.dart';
import 'package:quiz_flutter/Screens/QuizSignUp.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

import '../utils/QuizConstant.dart';

class QuizWelcome extends StatefulWidget {
  static String tag = '/QuizWelcome';

  @override
  _QuizWelcomeState createState() => _QuizWelcomeState();
}

class _QuizWelcomeState extends State<QuizWelcome> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(children: [
              Column(children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                    child: Column(children: [
                      commonCacheImageWidget(
                        "images/quiz/quiz.png",
                      ),
                      commonCacheImageWidget(
                        "images/quiz/bienvenue.png",
                      ),
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(60, 90, 60, 0),
                    child: quizButton(
                        textContent: "Accéder à l'appli",
                        onPressed: () {
                          setState(
                            () {
                              QuizDashboard().launch(context);
                            },
                          );
                        }))
              ]),
            ]),
          ),
        )));
  }
}
