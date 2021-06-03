import 'package:flutter/material.dart';

class ScreenNavigator {
  static void changeScreen(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void replacementScreen(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void replacementScreenUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (Route<dynamic> route) => false);
  }
}
