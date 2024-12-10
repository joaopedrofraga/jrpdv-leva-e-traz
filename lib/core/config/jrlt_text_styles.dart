import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';

class JRLTTextStyles {
  static final JRLTTextStyles _singleton = JRLTTextStyles._internal();

  factory JRLTTextStyles() {
    return _singleton;
  }

  JRLTTextStyles._internal();

  static TextStyle get getNormalStyle => TextStyle(
        color: JRLTColors.blackColor,
        fontSize: 14,
      );

  static TextStyle get getNormalBoldStyle => getNormalStyle.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get getTitleStyle => getNormalBoldStyle.copyWith(
        fontSize: 24,
      );

  static TextStyle get getSmallStyle => getNormalStyle.copyWith(
        fontSize: 12,
      );
}
