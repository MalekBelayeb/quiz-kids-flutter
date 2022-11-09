import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/PurchaseMoreScreen.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizCard.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';

import '../model/QuizModels.dart';

class QuizArtCards extends StatefulWidget {
  static String tag = '/QuizArtCards';

  @override
  _QuizArtCardsState createState() => _QuizArtCardsState();
}

class _QuizArtCardsState extends State<QuizArtCards> {
  List<Widget> cardList = [];

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards();
  }

  late QuizTestModel model;
  QuizArtCards(QuizTestModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: Stack(alignment: Alignment.center, children: cardList),
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
                        value: 0.5 + 1,
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
    List<Quiz> planetCard = [];

    planetCard.add(
      Quiz(
          " Comment Appelle-T-On Les\nCouleurs Obtenues En\nMélangeant Des Quantités\nÉgales De Deux Couleurs\nPrimaires ?",
          'Rouge',
          'Noir',
          'Blanc',
          'Bleu',
          70.0),
    );

    /* planetCard.add(
      Quiz("Qui a écrit le roman Dracula ? ", "Philip Roth", "Ernest Hemingway",
          "Venules", "Victor Hugo", 80.0),
    );
     planetCard.add(Quiz(
        "Qui est le principal \nreprésentant du naturalisme \nlittéraire ?",
        "André Malraux",
        "Emile Zola",
        "Alexandre Dumas",
        "Jean de La Fontaine",
        90.0));

    planetCard.add(Quiz(
        "Lequel de ces romans \nn'a pas été écrit\n par Robert Louis Stevenson",
        "L'Île au trésor",
        "L'Étrange Cas du Dr Jekyll \net de Mr Hyde",
        "Le Maître de Ballantrae",
        "Voyage au centre de la Terre",
        100.0));
    planetCard.add(
      Quiz("Qui a composé l'opéra 'La Traviata' ?", "Verdi", "Beethoven",
          "Joseph Haydn", "Maurice Ravel", 110.0),
    );

    planetCard.add(
      Quiz("En quel siècle est né\nWilliam Shakespeare ?", "16e siècle",
          "12e siècle", "18e siècle", "20e siècle", 110.0),
    );
    planetCard.add(
      Quiz(
          " Lequel des personnages de \n'Le Merveilleux Magicien d'Oz' \nn'avait pas de cerveau \npour penser ?",
          "Épouvantail",
          "Betsy Canette",
          "Button-Bright",
          "Cap'n Bill",
          110.0),
    );
    planetCard.add(
      Quiz(
          "Qu'est-ce que le renard \nde la fable de\nLa Fontaine n'aimait \npas parce qu'il était vert ?",
          "l'herbe",
          "le choux",
          "les raisins",
          "les epinards",
          110.0),
    );
    planetCard.add(
      Quiz(
          "Dans quel pays européen \nse déroule l'action \nde Roméo et Juliette \nde Shakespeare ?",
          "l'egypte",
          "l'amerique",
          "l'espagne",
          "l'italy",
          110.0),
    );
    planetCard.add(
      Quiz(" Qui a peint le tableau\nLe vieux guitariste ?", "Pablo Picasso",
          "Salvado Dali", "Claude Monet", "Leonardo da vinci", 110.0),
    );
*/
    for (int x = 0; x < 1; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
              childWhenDragging: Container(),
              feedback: Material(
                child: GestureDetector(
                  child: Container(
                    decoration: boxDecoration(
                        radius: 20, bgColor: quiz_white, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 250.0,
                          width: 320.0,
                          child: Container(
                            margin: EdgeInsets.only(top: 80),
                            padding: EdgeInsets.fromLTRB(20, 26, 20, 16),
                            child: text(planetCard[x].cardImage,
                                fontSize: textSizeSMedium,
                                fontFamily: fontBold,
                                isLongText: true),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                            child: Column(
                              children: <Widget>[
                                quizCardSelection("A.", planetCard[x].option1,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                                quizCardSelection("B.", planetCard[x].option2,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                                quizCardSelection("C.", planetCard[x].option3,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                                quizCardSelection("D.", planetCard[x].option4,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
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
                              padding: EdgeInsets.fromLTRB(20, 26, 20, 16),
                              child: text(planetCard[x].cardImage,
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontBold,
                                  isLongText: true),
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                            child: Column(
                              children: <Widget>[
                                quizCardSelection("A.", planetCard[x].option1,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                                quizCardSelection("B.", planetCard[x].option2,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                                quizCardSelection("C.", planetCard[x].option3,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                                quizCardSelection("D.", planetCard[x].option4,
                                    () {
                                  if (x == 0) {
                                    setState(() {
                                      PurchaseMoreScreen().launch(context);
                                    });
                                  }
                                  removeCards(x);
                                }),
                              ],
                            ))
                      ],
                    )),
              )),
        ),
      );
    }
    return cardList;
  }
}

Widget quizCardSelection(var option, var option1, onPressed) {
  return InkWell(
    onTap: () {
      onPressed();
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: boxDecoration(
          showShadow: false,
          bgColor: quiz_edit_background,
          radius: 10,
          color: quiz_view_color),
      padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
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
