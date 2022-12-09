import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/controller/QuizController.dart';
import 'package:quiz_flutter/data/models/Category.dart';
import 'package:quiz_flutter/data/models/Quiz.dart';
import 'package:quiz_flutter/data/models/QuizAttempt.dart';
import 'package:quiz_flutter/screens/QuizAttemptDetail.dart';
import 'package:quiz_flutter/screens/QuizStart.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/Consts.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

class CategoryDetails extends StatefulWidget {
  static String tag = '/CategoryDetails';

  CategoryBodyRes category;
  CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<QuizBodyRes> mList = [];
  QuizController quizController = QuizController();
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    QuizController.instance
        .getAllQuizByCat(widget.category.id ?? "")
        .then((value) {
      setState(() {
        this.mList = value ?? [];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: Column(
        children: <Widget>[
          quizTopBar(widget.category.name),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  text(widget.category.name,
                      isLongText: true,
                      fontFamily: fontBold,
                      isCentered: true,
                      fontSize: textSizeXLarge),
                  text("${widget.category.quizCount} Quiz",
                      textColor: quiz_textColorSecondary),
                  SizedBox(
                    height: 10,
                  ),
                  isLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 260,
                          child: Center(
                              child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                quiz_colorPrimary),
                          )),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: mList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return quizList(model: mList[index], pos: index);
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
  var width;

  QuizBodyRes? model;

  quizList({required QuizBodyRes model, required int pos}) {
    this.model = model;
  }

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
                  padding: EdgeInsets.all(4),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(8), // Image radius
                      child: commonCacheImageWidget(
                        '${Consts.baseUrl}/uploads/${model?.image}',
                      ),
                    ),
                  )),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model?.name,
                      textColor: quiz_textColorSecondary,
                      fontSize: textSizeLargeMedium),
                  text(
                    '${model?.category?.name ?? ""} | ${model?.difficulty ?? ""}',
                    fontSize: textSizeSMedium,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          text(model?.description,
              textColor: quiz_textColorSecondary,
              fontSize: textSizeLargeMedium),
          SizedBox(
            height: 16,
          ),
          quizButton(
              textContent: quiz_lbl_begin,
              onPressed: () {
                QuizStart(
                  model: model,
                ).launch(context);
              })
        ],
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class QuizAttemptItem extends StatelessWidget {
  var width;

  AllQuestionsAttemptBodyRes? model;

  QuizAttemptItem(
      {required AllQuestionsAttemptBodyRes model, required int pos}) {
    this.model = model;
  }

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
                  padding: EdgeInsets.all(4),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(8), // Image radius
                      child: commonCacheImageWidget(
                        '${Consts.baseUrl}/uploads/${model?.quiz?.image}',
                      ),
                    ),
                  )),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model?.quiz?.name,
                      textColor: quiz_textColorSecondary,
                      fontSize: textSizeLargeMedium),
                  text(
                    '${model?.quiz?.category?.name ?? ""} | ${model?.quiz?.difficulty ?? ""}',
                    fontSize: textSizeSMedium,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          text(model?.quiz?.description,
              textColor: quiz_textColorSecondary,
              fontSize: textSizeLargeMedium),
          SizedBox(
            height: 16,
          ),
          quizButton(
              textContent: "Consulter",
              onPressed: () {
                if (model == null) return;
                QuizAttemptDetail(
                  quizAttempDetail: model!,
                ).launch(context);
              })
        ],
      ),
    );
  }
}
