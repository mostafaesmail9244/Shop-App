import 'package:flutter/material.dart';

class Constant {
  static const defaultColor = Colors.blue;
  static const kOnBoarding = 'onBoarding';
  static const kToken = 'token';

  static void printFullText(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((matech) => debugPrint(matech.group(0)));
  }

  static String? token;
}
