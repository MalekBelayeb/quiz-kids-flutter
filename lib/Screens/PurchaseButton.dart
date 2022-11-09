import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'QuizSignUp.dart';

class PurchaseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Payer pour voir plus',
      color: quiz_colorPrimary,
      textStyle: boldTextStyle(color: Colors.white),
      shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
    );
  }
}
