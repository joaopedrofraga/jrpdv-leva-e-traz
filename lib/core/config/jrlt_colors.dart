import 'package:flutter/material.dart';

class JRLTColors {
  static final JRLTColors _singleton = JRLTColors._internal();

  factory JRLTColors() {
    return _singleton;
  }

  JRLTColors._internal();

  static Color get primaryColor => const Color.fromARGB(255, 111, 176, 233);

  static Color get secundaryColor => Colors.white;

  static Color get errorColor => const Color(0xFFdc3545);

  static Color get successColor => Colors.green;

  static Color get blackColor => Colors.black;
}
