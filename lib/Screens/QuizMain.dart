import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/Screens/QuizSignIn.dart';
import 'package:quiz_flutter/Screens/signup/QuizSignUp.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

import '../utils/QuizConstant.dart';

class QuizMain extends StatefulWidget {
  static String tag = '/QuizMain';

  @override
  _QuizMainState createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Column(
                children: [
                  commonCacheImageWidget("images/quiz/ic_background.png",
                      height: 150, width: 250),
                  Column(children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                        child: Column(children: [
                          commonCacheImageWidget("images/quiz/kids1.png",
                              height: 150, width: 300),
                          commonCacheImageWidget("images/quiz/kids2.png",
                              height: 100, width: 250),
                        ])),
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 30, 60, 0),
                      child: quizButton(
                        textContent: "Se Connecter",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizSignIn()));
                        },
                      ),
                    ),
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 20, 60, 0),
                      child: quizButton(
                        textContent: "S'inscrire",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizSignUp()));
                        },
                      ),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizDashboard()));
                        },
                        child: Text('Accés invité'),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ));
  }
}
