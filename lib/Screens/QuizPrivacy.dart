import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/PurchaseButton.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizStrings.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';

class QuizPrivacy extends StatefulWidget {
  final bool? enableAppbar;

  QuizPrivacy({this.enableAppbar = false});

  @override
  _QuizPrivacyState createState() => _QuizPrivacyState();
}

class _QuizPrivacyState extends State<QuizPrivacy> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Privacy & Terms",
            style: primaryTextStyle(size: 18, fontFamily: "Medium"),
          ),
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
        body: Stack(
          children: [
            Icon(Icons.arrow_back, size: 24).paddingAll(16).onTap(() {
              finish(context);
            }).visible(widget.enableAppbar!),
            SizedBox(
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Politique de confidentialité pour  Chez KidzQuiz,  l'une de nos principales priorités est la confidentialité de nos visiteurs. Ce document de politique de confidentialité contient des types d'informations qui sont collectées et enregistrées par quizkids et comment nous les utilisons.Si vous avez des questions supplémentaires ou souhaitez plus d'informations sur notre politique de confidentialité, n'hésitez pas à nous contacter.Cette politique de confidentialité s'applique uniquement à nos activités en ligne et est valable pour les visiteurs de notre site Web en ce qui concerne les informations qu'ils partagent et/ou collectent dans quizkids. Cette politique ne s'applique pas aux informations collectées hors ligne ou via des canaux autres que ce site Web. Notre politique de confidentialité a été créée à l'aide du générateur de politique de confidentialité gratuit de TermsFeed .Consentement En utilisant notre site Web, vous consentez par la présente à notre politique de confidentialité et acceptez ses conditions. Informations que nous collectons Les informations personnelles que vous êtes invité à fournir, et les raisons pour lesquelles vous êtes invité à les fournir, vous seront précisées au moment où nous vous demanderons de fournir vos informations personnelles. Si vous nous contactez directement, nous pouvons recevoir des informations supplémentaires vous concernant telles que votre nom, votre adresse e-mail, votre numéro de téléphone, le contenu du message et/ou des pièces jointes que vous pouvez nous envoyer, et toute autre information que vous pouvez choisir de fournir. Lorsque vous créez un compte, nous pouvons vous demander vos coordonnées, y compris des éléments tels que le nom, le nom de l entreprise, l adresse, l adresse e-mail et le numéro de téléphone.",
                    style: TextStyle(fontFamily: 'Raleway'),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                ],
              ),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
