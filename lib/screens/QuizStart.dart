import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/controller/QuizController.dart';
import 'package:quiz_flutter/data/models/Question.dart';
import 'package:quiz_flutter/data/models/Quiz.dart';
import 'package:quiz_flutter/data/models/QuizAttempt.dart';
import 'package:quiz_flutter/screens/QuizDetail.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';
import 'package:quiz_flutter/utils/Consts.dart';

class QuizStart extends StatefulWidget {
  static String tag = '/QuizWelcome';
  QuizBodyRes? model;

  QuizStart({this.model});

  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
            child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(children: [
                          commonCacheImageWidget(
                              '${Consts.baseUrl}/uploads/${widget.model?.image}',
                              height: 200),
                        ])),
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: text(widget.model?.name ?? "",
                                isLongText: true,
                                fontFamily: fontBold,
                                isCentered: true,
                                fontSize: textSizeXLarge),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: text(widget.model?.description ?? "",
                                isLongText: true,
                                fontFamily: fontRegular,
                                isCentered: true,
                                fontSize: textSizeLarge),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(60, 90, 60, 60),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                quiz_colorPrimary),
                          ))
                        : quizButton(
                            textContent: "Commencez maintenant",
                            onPressed: () {
                              setState(
                                () {
                                  isLoading = true;
                                  QuizController.instance
                                      .createQuizAttempt(widget.model?.id ?? "")
                                      .then((value) {
                                    if (value is QuizAttemptBodyRes) {
                                      isLoading = false;

                                      if (value.alreadyPlayed == true) {
                                        showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: Row(children: [
                                                    Image.asset(
                                                      'images/quiz/alerte.png',
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    Text(
                                                      'Quiz already played',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    )
                                                  ]),
                                                  content: Text(
                                                      "You have already played this quiz",
                                                      style: TextStyle(
                                                          fontSize: 14)),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text(
                                                          "Yes, play again"),
                                                      onPressed: () {
                                                        QuizDetail(
                                                          quizId:
                                                              value.id ?? "",
                                                          questions: widget
                                                                  .model
                                                                  ?.questions ??
                                                              [],
                                                          quizAlreadyPlayed:
                                                              true,
                                                        ).launch(context);
                                                      },
                                                    )
                                                  ],
                                                ));
                                      } else {
                                        QuizDetail(
                                          quizId: value.id ?? "",
                                          questions:
                                              widget.model?.questions ?? [],
                                          quizAlreadyPlayed: false,
                                        ).launch(context);
                                      }
                                    }
                                  });
                                },
                              );
                            }))
              ]),
        )));
  }
}
