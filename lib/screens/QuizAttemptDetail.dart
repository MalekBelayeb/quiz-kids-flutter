import 'package:flutter/material.dart';
import 'package:quiz_flutter/data/models/Answer.dart';
import 'package:quiz_flutter/data/models/QuizAttempt.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';

class QuizAttemptDetail extends StatefulWidget {
  AllQuestionsAttemptBodyRes quizAttempDetail;

  QuizAttemptDetail({required this.quizAttempDetail});
  @override
  State<QuizAttemptDetail> createState() => _QuizAttemptDetailState();
}

class _QuizAttemptDetailState extends State<QuizAttemptDetail> {
  List<QuestionAttemptBodyRes> questionAttempts = [];
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: quiz_app_background,
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.quizAttempDetail.questions.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>
                QuizAttemptSingleItem(
                    questionBodyRes: widget.quizAttempDetail.questions[index]),
          )),
    );
  }
}

class QuizAttemptSingleItem extends StatelessWidget {
  QuestionAttemptBodyRes questionBodyRes;

  QuizAttemptSingleItem({required this.questionBodyRes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
          decoration:
              boxDecoration(radius: 20, bgColor: quiz_white, showShadow: true),
          child: Column(
            children: <Widget>[
              Container(
                  height: 200.0,
                  width: 320.0,
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: text(questionBodyRes.question?.question,
                        fontSize: textSizeLarge,
                        fontFamily: fontBold,
                        isLongText: true),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      for (var y = 0;
                          y < (questionBodyRes.question?.answers?.length ?? 0);
                          y++) ...{
                        QuizCardSelection(
                          quizId: "",
                          questionId: questionBodyRes.id,
                          answer: questionBodyRes.question?.answers?[y],
                          userAnswer: questionBodyRes.userAnswer,
                          questionIndex: 0,
                        )
                      },
                    ],
                  ))
            ],
          )),
    );
  }
}

class QuizCardSelection extends StatefulWidget {
  AnswerBodyRes? answer;
  String? userAnswer;
  String? quizId;
  String? questionId;
  int questionIndex;

  QuizCardSelection(
      {required this.answer,
      required this.userAnswer,
      required this.questionId,
      required this.quizId,
      required this.questionIndex});

  @override
  State<QuizCardSelection> createState() => _QuizCardSelectionState();
}

class _QuizCardSelectionState extends State<QuizCardSelection> {
  bool isCorrectAnswer = false;
  bool isWrongAnswerByUser = false;

  @override
  void initState() {
    isCorrectAnswer = (widget.answer?.isCorrect ?? false);

    isWrongAnswerByUser =
        !isCorrectAnswer && widget.answer?.id == (widget.userAnswer ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: boxDecoration(
            showShadow: false,
            bgColor: (isCorrectAnswer)
                ? quiz_color_green.withOpacity(0.1)
                : isWrongAnswerByUser
                    ? quiz_color_red.withOpacity(0.1)
                    : quiz_edit_background.withOpacity(0.1),
            radius: 10,
            color: (isCorrectAnswer)
                ? quiz_color_green
                : isWrongAnswerByUser
                    ? quiz_color_red
                    : quiz_edit_background),
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
