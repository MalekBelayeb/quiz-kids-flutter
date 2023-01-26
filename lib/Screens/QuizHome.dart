import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:quiz_flutter/Screens/QuizNewList.dart';
import 'package:quiz_flutter/controller/CategoryController.dart';
import 'package:quiz_flutter/data/models/Category.dart';
import 'package:quiz_flutter/model/CategoryModel.dart';
import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/model/UserModel.dart';
import 'package:quiz_flutter/screens/CategoryDetails.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/Consts.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizDataGenerator.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

class QuizHome extends StatefulWidget {
  static String tag = '/QuizHome';
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  List<CategoryBodyRes> categoryList = [];
  List<CategoryBodyRes> initialCategoryList = [];

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    this.isLoading = true;

    CategoryController.instance.getAllCategories().then(((categories) {
      setState(() {
        isLoading = false;
        categoryList = categories ?? [];
        initialCategoryList = categories ?? [];
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  text("Bonjour" + NewUserModel().username.toString(),
                      fontFamily: fontBold, fontSize: textSizeXLarge),
                  text("Que voulez vous aprendre aujourd'hui?",
                      textColor: quiz_textColorSecondary,
                      isLongText: true,
                      isCentered: true),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    decoration: boxDecoration(
                        radius: 10, showShadow: true, bgColor: quiz_white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: quizEditTextStyle(quiz_lbl_search,
                                isPassword: false, onChangeText: (val) {
                          setState(() {
                            if (val == "") {
                              categoryList = this.initialCategoryList;
                            } else {
                              categoryList = this
                                  .categoryList
                                  .where((element) =>
                                      element.name
                                          ?.toLowerCase()
                                          .contains(val.toLowerCase()) ??
                                      false)
                                  .toList();
                            }
                          });
                        })),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: boxDecoration(
                              radius: 10,
                              showShadow: false,
                              bgColor: quiz_colorPrimary),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search, color: quiz_white),
                        ).onTap(() {
                          //QuizSearch().launch(context);
                          //setState(() {});
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text("Tout les categories",
                            textAllCaps: false,
                            fontFamily: fontMedium,
                            fontSize: textSizeNormal),
                        text(
                          "Voir Tout",
                          textColor: quiz_textColorSecondary,
                        ).onTap(() {
                          setState(() {
                            QuizListing().launch(context);
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    //height: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    child: isLoading
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
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryList.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!(categoryList[index].locked ?? false)) {
                                    CategoryDetails(
                                      category: categoryList[index],
                                    ).launch(context);
                                  } else {
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
                                                  'you dont have enough point',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                )
                                              ]),
                                              content: Text(
                                                  "you dont have enough point you need more point to proceed",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                            ));
                                  }
                                });
                              },
                              child: CategoryItem(
                                model: categoryList[index],
                                pos: index,
                              ),
                            ),
                          ),
                  ).paddingOnly(bottom: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryBodyRes? categorie;
  double widthPercent;
  double heightPercent;
  bool isVerticalList;
  double fontSize;
  CategoryItem(
      {required CategoryBodyRes model,
      required int pos,
      this.widthPercent = 0.75,
      this.heightPercent = 0.25,
      this.isVerticalList = false,
      this.fontSize = 18.0}) {
    categorie = model;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16),
          width: MediaQuery.of(context).size.width * widthPercent,
          decoration:
              boxDecoration(radius: 16, showShadow: true, bgColor: quiz_white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Container(
                          height: MediaQuery.of(context).size.height *
                              heightPercent,
                          child: Image.network(
                            '${Consts.baseUrl}/uploads/${categorie?.image}',
                            fit: BoxFit.cover,
                          ))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(categorie?.name,
                            fontSize: this.fontSize,
                            isLongText: true,
                            fontFamily: fontMedium,
                            isCentered: false,
                            textColor: quiz_textColorPrimary),
                        Icon(Icons.arrow_forward,
                            color: quiz_textColorSecondary),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('${categorie?.requiredPoints ?? 0} Points',
                            textColor: quiz_textColorSecondary,
                            fontSize: this.fontSize),
                        text('${categorie?.quizCount ?? 0} Quiz',
                            textColor: quiz_textColorSecondary,
                            fontSize: this.fontSize),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        (categorie?.locked ?? false)
            ? Positioned(
                top: 0,
                bottom: 0,
                right: isVerticalList ? null : 0,
                left: isVerticalList ? null : 0,
                child: Container(
                  decoration: boxDecoration(
                      radius: 16,
                      showShadow: true,
                      bgColor: Colors.grey.withOpacity(0.4)),
                  margin: EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width * widthPercent,
                  child: Center(
                      child: Icon(
                    IconData(0xe3ae, fontFamily: 'MaterialIcons'),
                    size: 62,
                    color: Colors.black87,
                  )),
                ))
            : SizedBox(),
      ],
    );
  }
}
