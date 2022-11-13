import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/signup/QuizlastName.dart';
import 'package:quiz_flutter/controller/AuthController.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

class QuizCreatePassword extends StatefulWidget {
  static String tag = '/QuizCreatePassword';

  @override
  _QuizCreatePasswordState createState() => _QuizCreatePasswordState();
}

class _QuizCreatePasswordState extends State<QuizCreatePassword> {
  var obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmepasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      backgroundColor: quiz_app_background,
      appBar: AppBar(
        title: text(quiz_lbl_Create_password,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            height: MediaQuery.of(context).size.height,
            color: quiz_app_background,
            child: Column(
              children: <Widget>[
                commonCacheImageWidget("images/quiz/reg2.png",
                    height: 150, width: 300),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(
                      bgColor: quiz_white,
                      // color: quiz_white,
                      showShadow: true,
                      radius: 10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          controller: passwordController,
                          autocorrect: false,
                          obscureText: true,
                          autofocus: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Mot de passe',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            /*   suffix: text(obscureText ? "Show" : "Hide",
                                    textColor: quiz_textColorSecondary,
                                    fontSize: textSizeNormal,
                                    fontFamily: fontMedium)
                                .onTap(() {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            }),
                            suffixText: (obscureText ? 'show' : "hide")),*/
                          )),
                      TextFormField(
                          controller: confirmepasswordController,
                          autocorrect: false,
                          obscureText: true,
                          autofocus: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Confirmer Mot de passe',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            /*   suffix: text(obscureText ? "Show" : "Hide",
                                    textColor: quiz_textColorSecondary,
                                    fontSize: textSizeNormal,
                                    fontFamily: fontMedium)
                                .onTap(() {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            }),
                            suffixText: (obscureText ? 'show' : "hide")),*/
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: quizButton(
                      textContent: quiz_lbl_continue,
                      onPressed: () {
                        setState(() {
                          if (passwordController.text.isEmptyOrNull) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Row(children: [
                                        Image.asset(
                                          'images/quiz/alerte2.png',
                                          width: 70,
                                          height: 70,
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
                          } else if (passwordController.text !=
                              confirmepasswordController.text) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Row(children: [
                                        Image.asset(
                                          'images/quiz/alerte2.png',
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          'Oups!!',
                                          textAlign: TextAlign.center,
                                        )
                                      ]),
                                      content: Text(
                                        "Les mots de passe doivent étre identiques",
                                        textAlign: TextAlign.center,
                                      ),
                                    ));

                            const Text('Show Dialog');
                          } else {
                            AuthController.instance.signupBodyReq.password =
                                passwordController.text;
                            QuizlastName().launch(context);
                          }
                        });
                      }),
                ),
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
                  finish(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
