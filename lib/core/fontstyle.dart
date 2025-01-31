import 'package:flutter/material.dart';

class Fontstyle {
  static const String fontFamily = 'Roboto';

  // ستايل العنوان
  static const TextStyle titleStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  );

  // ستايل الخط العادي
  static const TextStyle normalStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle bottonfontStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white);
}
