import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/PurchaseMoreScreen.dart';
import 'package:quiz_flutter/Screens/QuizArt.dart';
import 'package:quiz_flutter/Screens/QuizScience.dart';
import 'package:quiz_flutter/model/QuizModels.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizDataGenerator.dart';

class QuizSearch extends StatefulWidget {
  static String tag = '/QuizSearch';

  @override
  _QuizSearchState createState() => _QuizSearchState();
}

class _QuizSearchState extends State<QuizSearch> {
  late List<NewQuizModel> mListings;
  var searchCont = TextEditingController();
  late NewQuizModel categorie;

  NewQuiz(NewQuizModel model, int pos) {
    categorie = model;
  }

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quiz_app_background,
        body: (SizedBox(
          //height: MediaQuery.of(context).size.width * 0.8,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mListings.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                setState(() {
                  if (NewQuiz(mListings[index], index).categorie.quizName ==
                      'Sciences') {
                    QuizScience(index: index).launch(context);
                  } else if (NewQuiz(mListings[index], index)
                          .categorie
                          .quizName ==
                      'Geographie') {
                    PurchaseMoreScreen().launch(context);
                  } else if (NewQuiz(mListings[index], index)
                          .categorie
                          .quizName ==
                      'Histoire') {
                    PurchaseMoreScreen().launch(context);
                  } else if (NewQuiz(mListings[index], index)
                          .categorie
                          .quizName ==
                      'Art') {
                    QuizArt(index: index).launch(context);
                  } else if (NewQuiz(mListings[index], index)
                          .categorie
                          .quizName ==
                      ' Sport') {
                    PurchaseMoreScreen().launch(context);
                  } else if (NewQuiz(mListings[index], index)
                          .categorie
                          .quizName ==
                      'Divertissement') {
                    PurchaseMoreScreen().launch(context);
                  }
                });
              },
              child: NewQuiz(mListings[index], index),
            ),
          ),
        ).paddingOnly(bottom: 16)));
  }
}
