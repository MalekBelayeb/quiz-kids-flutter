import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/PurchaseMoreScreen.dart';
import 'package:quiz_flutter/controller/CategoryController.dart';
import 'package:quiz_flutter/data/models/Category.dart';
import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/screens/CategoryDetails.dart';
import 'package:quiz_flutter/screens/QuizHome.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizDataGenerator.dart';
import 'package:quiz_flutter/utils/QuizImages.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';

class QuizListing extends StatefulWidget {
  static String tag = '/QuizListing';

  @override
  _QuizListingState createState() => _QuizListingState();
}

class _QuizListingState extends State<QuizListing> {
  late List<NewQuizModel> mListings;
  List<CategoryBodyRes> categoryList = [];
  List<CategoryBodyRes> initialCategoryList = [];

  var isLoading = false;

  var selectedGrid = true;
  var selectedList = false;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
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
    var w = MediaQuery.of(context).size.width;

    final listing = Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: categoryList.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!(categoryList[index].locked ?? false)) {
                          CategoryDetails(
                            category: categoryList[index],
                          ).launch(context);
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Row(children: [
                                      Image.asset(
                                        'images/quiz/alerte.png',
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        'you dont have enough point',
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ]),
                                    content: Text(
                                        "you dont have enough point you need more point to proceed",
                                        style: TextStyle(fontSize: 14)),
                                  ));
                        }
                      });
                    },
                    child: CategoryItem(
                      model: categoryList[index],
                      pos: index,
                      widthPercent: 0.6,
                      isVerticalList: true,
                      fontSize: 14,
                    ),
                  ),
                ),
              )),
    );

    final gridList = StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 22.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      scrollDirection: Axis.vertical,
      itemCount: categoryList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        changeStatusColor(quiz_app_background);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (!(categoryList[index].locked ?? false)) {
                CategoryDetails(
                  category: categoryList[index],
                ).launch(context);
              } else {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Row(children: [
                            Image.asset(
                              'images/quiz/alerte.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              'you dont have enough point',
                              style: TextStyle(fontSize: 14),
                            )
                          ]),
                          content: Text(
                              "you dont have enough point you need more point to proceed",
                              style: TextStyle(fontSize: 14)),
                        ));
              }
            });
          },
          child: CategoryItem(
            model: categoryList[index],
            pos: index,
            fontSize: 12,
          ),
        );
      },
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.58, crossAxisSpacing: 16, mainAxisSpacing: 16),
    );

    changeStatusColor(quiz_app_background);

    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_new_quiz,
            fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading: Icon(
          Icons.arrow_back,
          color: quiz_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: quiz_app_background,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: quiz_app_background,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    commonCacheImageWidget(
                      Quiz_ic_Grid,
                      height: 20,
                      width: 20,
                    ).onTap(() {
                      setState(() {
                        selectedList = false;
                        selectedGrid = true;
                      });
                    }).paddingOnly(top: 8, right: 16),
                    commonCacheImageWidget(
                      Quiz_ic_List,
                      height: 20,
                      width: 20,
                    ).onTap(() {
                      setState(() {
                        selectedList = true;
                        selectedGrid = false;
                      });
                    }).paddingOnly(top: 8, right: 16),
                  ],
                ),
                SingleChildScrollView(
                    child: Container(
                  margin: EdgeInsets.all(16),
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
                      : (selectedGrid ? gridList : listing),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
