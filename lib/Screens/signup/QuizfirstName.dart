import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/Screens/signup/QuizfirstName.dart';
import 'package:quiz_flutter/controller/AuthController.dart';
import 'package:quiz_flutter/data/models/Auth.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';
//import 'package:quiz_flutter/utils/codePicker/country_code_picker.dart';

class QuizfirstName extends StatefulWidget {
  static String tag = '/QuizfirstName';

  @override
  _QuizfirstNameState createState() => _QuizfirstNameState();
}

class _QuizfirstNameState extends State<QuizfirstName> {
  TextEditingController firstnameController = TextEditingController();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      backgroundColor: quiz_app_background,
      appBar: AppBar(
        title: text("Prénom",
            fontSize: textSizeLargeMedium,
            fontFamily: fontMedium,
            textColor: quiz_colorPrimary),
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
          height: MediaQuery.of(context).size.height,
          color: quiz_app_background,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                commonCacheImageWidget("images/quiz/reg4.png",
                    height: 150, width: 300),
                Container(
                    decoration: boxDecoration(
                        bgColor: quiz_app_background,
                        showShadow: true,
                        radius: 10),
                    margin: EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: firstnameController,
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Prénom',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        ])),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                quiz_colorPrimary),
                          ))
                        : quizButton(
                            textContent: quiz_lbl_continue,
                            onPressed: () async {
                              var isCorrectForm = false;

                              setState(() {
                                if (!RegExp("[a-zA-Z]")
                                    .hasMatch(firstnameController.text)) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Veuillez saisir votre Prénom réel'),
                                  ));
                                } else if (firstnameController
                                    .text.isEmptyOrNull) {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Row(children: [
                                              Image.asset(
                                                'images/quiz/alerte1.png',
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.contain,
                                              ),
                                              Text(
                                                'Oups!!',
                                                textAlign: TextAlign.center,
                                              )
                                            ]),
                                            content: Text(
                                              "Champs requi",
                                              textAlign: TextAlign.center,
                                            ),
                                          ));

                                  const Text('Show Dialog');
                                } else {
                                  isCorrectForm = true;
                                }
                              });

                              if (isCorrectForm) {
                                setState(() {
                                  isLoading = true;
                                  AuthController.instance.signupBodyReq
                                      .firstname = firstnameController.text;
                                  AuthController.instance
                                      .signup()!
                                      .then((value) {
                                    isLoading = false;
                                    if (value is SigninErrorRes) {
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: Row(children: [
                                                  Image.asset(
                                                    'images/quiz/alerte1.png',
                                                    width: 80,
                                                    height: 80,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  Text(
                                                    'Oups!!',
                                                    textAlign: TextAlign.center,
                                                  )
                                                ]),
                                                content: Text(
                                                  "Something went wrong please try again later",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ));
                                    }
                                  });
                                });
                              }
                            })),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      text("VOUS AVEZ DEJA COMPTE?", textColor: gray),
                      text(quiz_lbl_sign_in,
                          textColor: darkBlue, textAllCaps: true),
                    ],
                  ),
                ).onTap(() {
                  Navigator.of(context).pop();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
