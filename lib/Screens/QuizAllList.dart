//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/controller/QuizController.dart';
import 'package:quiz_flutter/data/models/Quiz.dart';
import 'package:quiz_flutter/data/models/QuizAttempt.dart';
import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/screens/CategoryDetails.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';

class QuizAllList extends StatefulWidget {
  static String tag = '/QuizAllList';

  @override
  _QuizAllListState createState() => _QuizAllListState();
}

class _QuizAllListState extends State<QuizAllList> {
  late List<NewQuizModel> mListings;

  List<QuizBodyRes> mList = [];
  List<AllQuestionsAttemptBodyRes> quizAttempts = [];

  var isLoadingQuizAll = false;
  var isLoadingCompleted = false;

  int selectedPos = 1;

  @override
  void initState() {
    super.initState();

    selectedPos = 1;
    isLoadingQuizAll = true;

    QuizController.instance.getAllQuizAttempt().then((value) {
      setState(() {
        this.quizAttempts = value ?? [];
      });
    });

    QuizController.instance.getAllQuiz().then((value) {
      setState(() {
        this.mList = value ?? [];
        isLoadingQuizAll = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget quizAll = isLoadingQuizAll
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 260,
            child: Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(quiz_colorPrimary),
            )),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return quizList(model: mList[index], pos: index);
            });

    Widget quizCompleted = isLoadingCompleted
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 260,
            child: Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(quiz_colorPrimary),
            )),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: quizAttempts.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return QuizAttemptItem(model: quizAttempts[index], pos: index);
            });

    return SafeArea(
      child: Scaffold(
        backgroundColor: quiz_app_background,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Container(
                  width: width,
                  decoration: boxDecoration(
                      radius: spacing_middle,
                      bgColor: quiz_white,
                      showShadow: false),
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            selectedPos = 1;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(spacing_middle),
                                  bottomLeft: Radius.circular(spacing_middle)),
                              color: selectedPos == 1
                                  ? quiz_white
                                  : Colors.transparent,
                              border: Border.all(
                                  color: selectedPos == 1
                                      ? quiz_white
                                      : Colors.transparent),
                            ),
                            child: text(
                              "Tout les Quiz",
                              fontSize: textSizeMedium,
                              isCentered: true,
                              fontFamily: fontMedium,
                              textColor: selectedPos == 1
                                  ? quiz_textColorPrimary
                                  : quiz_textColorSecondary,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Container(height: 40, width: 1, color: quiz_light_gray)
                          .center(),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPos = 2;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(spacing_middle),
                                  bottomRight: Radius.circular(spacing_middle)),
                              color: selectedPos == 2
                                  ? quiz_white
                                  : Colors.transparent,
                              border: Border.all(
                                  color: selectedPos == 2
                                      ? quiz_white
                                      : Colors.transparent),
                            ),
                            child: text(
                              "Complet",
                              fontSize: textSizeMedium,
                              isCentered: true,
                              fontFamily: fontMedium,
                              textColor: selectedPos == 2
                                  ? quiz_textColorPrimary
                                  : quiz_textColorSecondary,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.only(right: 8, left: 8),
                    child: selectedPos == 1 ? quizAll : quizCompleted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
