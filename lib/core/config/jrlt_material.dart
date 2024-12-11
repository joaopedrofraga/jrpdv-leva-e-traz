import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';

class JRLTMaterial {
  static final JRLTMaterial _singleton = JRLTMaterial._internal();

  factory JRLTMaterial() {
    return _singleton;
  }

  JRLTMaterial._internal();

  static const String title = 'CashPB';

  static const Locale locale = Locale('pt_BR');

  static Container backgroundImageWidget = Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)));

  static ThemeData get getTheme => ThemeData(
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: JRLTColors.primaryColor,
          cursorColor: JRLTColors.primaryColor),
      scaffoldBackgroundColor: JRLTColors.secundaryColor,
      colorSchemeSeed: JRLTColors.primaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: JRLTColors.primaryColor, elevation: 7),
      appBarTheme: AppBarTheme(
        backgroundColor: JRLTColors.primaryColor,
        titleTextStyle: TextStyle(
            color: JRLTColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16),
        centerTitle: true,
        elevation: 0,
      ),
      fontFamily: 'Lato');
}
