import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';

void mostrarSnackbar(
    {required BuildContext context,
    required String mensagem,
    required bool isError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 7,
      content: TextWidget.bold(mensagem, color: JRLTColors.secundaryColor),
      backgroundColor:
          isError ? JRLTColors.errorColor : JRLTColors.successColor));
}
