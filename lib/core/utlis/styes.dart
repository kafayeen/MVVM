import 'package:book_views/core/utlis/colors.dart';
import 'package:book_views/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

abstract class CustomTextStyle {
  static TextStyle style15 = TextStyle(
    fontSize: CustomFonts.text15.toDouble(),
    fontWeight: FontWeight.bold,
  );
  static TextStyle style14 = TextStyle(
      fontSize: CustomFonts.text14.toDouble(),
      fontWeight: FontWeight.normal,
      color: CustomColor.textColor.withOpacity(0.7));
  static TextStyle style17 = TextStyle(
    fontSize: CustomFonts.text17.toDouble(),
    fontWeight: FontWeight.bold,
  );
  static TextStyle style12 = TextStyle(
    fontSize: CustomFonts.text12.toDouble(),
    fontWeight: FontWeight.bold,
  );
}
