import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz_flutter/Screens/PurchaseButton.dart';
import 'package:quiz_flutter/utils/AppWidget.dart';
import 'package:quiz_flutter/utils/QuizColors.dart';

class PurchaseMoreScreen extends StatefulWidget {
  final bool? enableAppbar;

  PurchaseMoreScreen({this.enableAppbar = false});

  @override
  _PurchaseMoreScreenState createState() => _PurchaseMoreScreenState();
}

class _PurchaseMoreScreenState extends State<PurchaseMoreScreen> {
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
        body: Stack(
          children: [
            AppBar(
              title: Text(
                "Payment",
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
            SizedBox(
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: boxDecorationDefault(shape: BoxShape.circle),
                      child: commonCacheImageWidget(
                        "images/quiz/ic_background.png",
                        height: 180,
                      ).cornerRadiusWithClipRRect(90)),
                  22.height,
                  Text(
                    'Celle l?? est une version lite , veuillez payer pour profiter de plus de quiz en ligne',
                    style: boldTextStyle(size: 22),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  PurchaseButton(),
                ],
              ),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
