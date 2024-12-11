import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';

void mostrarSnackbar(
    {required BuildContext context,
    required String mensagem,
    required bool isError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 7,
      content: Text('oi'),
      backgroundColor:
          isError ? JRLTColors.errorColor : JRLTColors.successColor));
}
