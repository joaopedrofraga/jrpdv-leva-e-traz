import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_material.dart';

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
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 700) {
              return Container(color: Colors.red);
            } else {
              return Container(color: Colors.blue);
            }
          },
        ),
      ),
    );
  }
}
