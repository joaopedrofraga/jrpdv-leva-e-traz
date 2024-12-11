import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_material.dart';
import 'package:levaetraz/presentation/auth/login/login_page.dart';
import 'package:levaetraz/routes.dart';

class JRLT extends StatefulWidget {
  const JRLT({super.key});

  @override
  State<JRLT> createState() => _JRLTState();
}

class _JRLTState extends State<JRLT> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: JRLTMaterial.title,
      theme: JRLTMaterial.getTheme,
      onGenerateRoute: Routes.generateRoute,
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
