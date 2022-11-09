import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizArtCards.dart';
import 'package:quiz_flutter/Screens/QuizArtCardsDifficile.dart';
import 'package:quiz_flutter/Screens/QuizArtCardsExpers.dart';
import 'package:quiz_flutter/Screens/QuizArtCardsMoyen.dart';

import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizDataGenerator.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

class QuizArt extends StatefulWidget {
  static String tag = '/QuizArt';
  late int index;
  late List<QuizTestModel> mList;
  QuizArt({Key? key, required this.index}) : super(key: key);
  @override
  _QuizArtState createState() => _QuizArtState();
}

class _QuizArtState extends State<QuizArt> {
  late List<QuizTestModel> mList;
  @override
  void initState() {
    super.initState();
    mList = quizGetData(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: Column(
        children: <Widget>[
          quizTopBar("Art"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  text("Musique, théatre & painture",
                      isLongText: true,
                      fontFamily: fontBold,
                      isCentered: true,
                      fontSize: textSizeXLarge),
                  text(quiz_text_4_to_8_lesson,
                      textColor: quiz_textColorSecondary),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return quizList(mList[index], index);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class quizList extends StatelessWidget {
  late var width;
  quizList(QuizTestModel model, int pos) {
    this.model = model;
  }
  late QuizTestModel model;
  QuizTestModel model1 = QuizTestModel();
  QuizTestModel model2 = QuizTestModel();
  QuizTestModel model3 = QuizTestModel();
  QuizTestModel model4 = QuizTestModel();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      decoration:
          boxDecoration(radius: 10, showShadow: true, bgColor: quiz_white),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: quiz_color_setting),
                width: width / 6.5,
                height: width / 6.5,
                padding: EdgeInsets.all(10),
                child: commonCacheImageWidget(
                  model.image,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.type,
                      textColor: quiz_textColorSecondary,
                      fontSize: textSizeSMedium),
                  text(
                    model.heading,
                    fontFamily: fontMedium,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          text(model.description, textColor: quiz_textColorSecondary),
          SizedBox(
            height: 16,
          ),
          quizButton(
              textContent: quiz_lbl_begin,
              onPressed: () {
                if (model.heading == 'Niveau1: Facile') {
                  QuizArtCards().launch(context);
                } else if (model.heading == 'Niveau2: Moyen') {
                  QuizArtCardsMoyen().launch(context);
                } else if (model.heading == 'Niveau3: Difficile') {
                  QuizArtCardsDifficile().launch(context);
                } else if (model.heading == 'Niveau4: Expert') {
                  QuizArtCardsExpers().launch(context);
                }
              })
        ],
      ),
    );
  }
}
