import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/QuizDashboard.dart';
import 'package:quiz_flutter/Screens/QuizSignUp.dart';
import 'package:quiz_flutter/service/AuthService.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:quiz_flutter/utils/QuizConstant.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizWidget.dart';

class QuizSignIn extends StatefulWidget {
  static String tag = '/QuizSignIn';

  @override
  _QuizSignInState createState() => _QuizSignInState();
}

class _QuizSignInState extends State<QuizSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      backgroundColor: quiz_app_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: quiz_app_background,
            margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                commonCacheImageWidget("images/quiz/login.png",
                    height: 175, width: 250),
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
                            controller: emailController,
                            autocorrect: false,
                            autofocus: false,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[200],
                            )),

                        /*    Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 25,
                          ),*/
                        TextFormField(
                          controller: passwordController,
                          autocorrect: false,
                          autofocus: false,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Mot de passe',
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ]),
                ),
                // SizedBox(  height: 10,),
                Container(
                    margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: quizButton(
                        textContent: "Se Connecter",
                        onPressed: () {
                          setState(() {
                            if (emailController.text.isEmptyOrNull ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text)) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Email invalid"),
                              ));
                            } else if (passwordController.text.isEmptyOrNull) {
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
                                          Text('  Oh!! Attention. ')
                                        ]),
                                        content: Text(
                                            "Tout les champs sont obligatoirs"),
                                      ));

                              const Text('Show Dialog');
                            } else {
                              // QuizDashboard().launch(context);
                              AuthService.login({
                                "email": emailController.text,
                                "password": passwordController.text
                              });
                            }
                          });
                        })),

                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      text("PAS DE COMPTE?", textColor: gray),
                      text(quiz_lbl_create_account,
                          textColor: darkBlue, fontFamily: fontSemibold),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    QuizSignUp().launch(context);
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
