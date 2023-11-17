import 'package:flutter/material.dart';

class AppFont {
  static const double _fontSize = 15.0;

  static TextStyle headingLarge({Color? color}) => TextStyle(
        fontSize: _fontSize + 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  static TextStyle headingMedium({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize + 5,
        fontWeight: FontWeight.w600,
      );

  static TextStyle headingSmall({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle headingSemiBoldLarge({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize + 10,
        fontWeight: FontWeight.w500,
      );

  static TextStyle heading({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize + 1,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bodyTextLarge({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize + 1,
      );

  static TextStyle bodyText({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize,
      );

  static TextStyle bodyTextSmall({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: _fontSize - 2,
      );
}
