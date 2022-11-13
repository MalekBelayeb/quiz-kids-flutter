import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/PurchaseMoreScreen.dart';
import 'package:quiz_flutter/Screens/QuizArt.dart';
import 'package:quiz_flutter/Screens/QuizNewList.dart';
import 'package:quiz_flutter/Screens/QuizScience.dart';
import 'package:quiz_flutter/Screens/QuizSearch.dart';
import 'package:quiz_flutter/controller/CategoryController.dart';
import 'package:quiz_flutter/model/CategoryModel.dart';
import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/model/UserModel.dart';
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
  List<CategoryModel> categoryList = [];

  @override
  void initState() {
    super.initState();
    CategoryController.instance.getAllCategories().then(((categories) {
      setState(() {
        //    categoryList = categories ?? [];
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
                  text("Bonjour!!" + NewUserModel().username.toString(),
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
                                isPassword: false)),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: boxDecoration(
                              radius: 10,
                              showShadow: false,
                              bgColor: quiz_colorPrimary),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search, color: quiz_white),
                        ).onTap(() {
                          QuizSearch().launch(context);
                          setState(() {});
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text("Quiz Gratuits",
                            textAllCaps: true,
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: CategoryItem(categoryList[index], index),
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
  late CategoryModel categorie;

  CategoryItem(CategoryModel model, int pos) {
    categorie = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width * 0.75,
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
                    height: 200,
                    child: Image.network(
                      '${Consts.baseUrl}/uploads/${categorie.image}',
                      fit: BoxFit.cover,
                    ),
                  )

                  /*CircleAvatar(
                    backgroundImage: AssetImage(categorie.quizImage),
                    radius: MediaQuery.of(context).size.width / 8.5),*/
                  ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(categorie.name,
                        fontSize: textSizeMedium,
                        isLongText: true,
                        fontFamily: fontMedium,
                        isCentered: false),
                    text('${5}', textColor: quiz_textColorSecondary),
                  ],
                ),
                Icon(Icons.arrow_forward, color: quiz_textColorSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
