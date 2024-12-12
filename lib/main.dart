import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:levaetraz/core/config/jrlt.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const JRLT());
}
