import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/controller/QuizController.dart';
import 'package:quiz_flutter/data/models/Answer.dart';
import 'package:quiz_flutter/data/models/Question.dart';
import 'package:quiz_flutter/screens/QuizFinish.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';

class QuizDetail extends StatefulWidget {
  static String tag = '/QuizCards';
  String quizId;
  List<QuestionBodyRes>? questions = [];
  QuizDetail({this.questions, required this.quizId});
  @override
  _QuizDetailState createState() => _QuizDetailState();
}

class _QuizDetailState extends State<QuizDetail> {
  List<Widget> cardList = [];
  double progressValue = 0;
  int score = 0;
  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
      if (widget.questions != null) {
        progressValue = index / widget.questions!.length;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Container(
                  child: Stack(alignment: Alignment.center, children: cardList),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: quiz_colorPrimary,
                      ),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progressValue,
                        backgroundColor: textSecondaryColor.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          quiz_green,
                        ),
                      ).paddingAll(16),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> _generateCards() {
    List<Widget> cardList = [];

    for (int x = 0; x < (widget.questions?.length ?? 0); x++) {
      cardList.add(
        Positioned(
          top: x * 15,
          child: GestureDetector(
            child: Container(
                decoration: boxDecoration(
                    radius: 20, bgColor: quiz_white, showShadow: true),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 200.0,
                        width: 320.0,
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: text(widget.questions?[x].question,
                              fontSize: textSizeLarge,
                              fontFamily: fontBold,
                              isLongText: true),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            for (var y = 0;
                                y < (widget.questions?[x].answers?.length ?? 0);
                                y++) ...{
                              QuizCardSelection(
                                quizId: widget.quizId,
                                questionId: widget.questions?[x].id,
                                answer: widget.questions?[x].answers?[y],
                                questionIndex: x,
                                gainedScore: (gain) {
                                  setState(() {
                                    score += gain;
                                  });
                                },
                                moveToNext: () {
                                  removeCards(x);
                                },
                                finishQuiz: () {
                                  QuizFinish(
                                    points: score,
                                    quizAttemptId: widget.quizId,
                                  ).launch(getContext);
                                },
                              )
                            },
                          ],
                        ))
                  ],
                )),
          ),
        ),
      );
    }
    return cardList;
  }

  Widget quizCardSelection(var option, var option1, bool isCorrect, onPressed) {
    bool showResult = false;
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: showResult
            ? boxDecoration(
                showShadow: false,
                bgColor: isCorrect
                    ? quiz_color_green.withOpacity(0.1)
                    : quiz_color_red.withOpacity(0.1),
                radius: 10,
                color: isCorrect ? quiz_color_green : quiz_color_red)
            : boxDecoration(
                showShadow: false,
                //quiz_edit_background
                bgColor: quiz_edit_background,
                radius: 10,
                color: quiz_edit_background),
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        width: 320,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(
              child: text(option1, textColor: quiz_textColorSecondary),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: text(option, textColor: quiz_textColorSecondary),
            )
          ],
        ),
      ),
    );
  }
}

class QuizCardSelection extends StatefulWidget {
  AnswerBodyRes? answer;
  String? quizId;
  String? questionId;

  Function moveToNext;
  Function finishQuiz;
  Function(int) gainedScore;

  int questionIndex;
  QuizCardSelection(
      {required this.answer,
      required this.questionId,
      required this.quizId,
      required this.questionIndex,
      required this.moveToNext,
      required this.finishQuiz,
      required this.gainedScore});

  @override
  State<QuizCardSelection> createState() => _QuizCardSelectionState();
}

class _QuizCardSelectionState extends State<QuizCardSelection> {
  bool showAnswers = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showAnswers = true;
        });

        if (widget.answer?.isCorrect ?? false) {
          widget.gainedScore(widget.answer?.score ?? 0);
        }

        QuizController.instance
            .addAnswerAttempt(widget.quizId ?? "", widget.questionId ?? "",
                widget.answer?.id ?? "")
            .then((value) {
          //if (value is AnswerAttemptBodyRes) {}
        });
        Timer(Duration(seconds: 2), () {
          if (widget.questionIndex == 0) {
            widget.finishQuiz();
          } else {
            widget.moveToNext();
          }
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: showAnswers
            ? boxDecoration(
                showShadow: false,
                bgColor: (widget.answer?.isCorrect ?? false)
                    ? quiz_color_green.withOpacity(0.1)
                    : quiz_color_red.withOpacity(0.1),
                radius: 10,
                color: (widget.answer?.isCorrect ?? false)
                    ? quiz_color_green
                    : quiz_color_red)
            : boxDecoration(
                showShadow: false,
                //quiz_edit_background
                bgColor: quiz_edit_background,
                radius: 10,
                color: quiz_edit_background),
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        width: 320,
        child: Center(
          child:
              text(widget.answer?.answer, textColor: quiz_textColorSecondary),
        ),
      ),
    );
  }
}
