import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  static NavigatorService instance = NavigatorService();

  Future<dynamic> navigateTo(Widget destination) {
    return globalKey.currentState!
        .push(MaterialPageRoute(builder: (context) => destination));
  }
}
