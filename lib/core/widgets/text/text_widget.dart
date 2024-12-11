import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/config/jrlt_text_styles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;

  const TextWidget(
    this.text, {
    required this.style,
    this.textAlign,
    this.color,
    this.overflow,
    super.key,
  });

  TextWidget.bold(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow,
  }) : style = textStyle ?? JRLTTextStyles.getNormalBoldStyle;

  TextWidget.title(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow,
  }) : style = textStyle ?? JRLTTextStyles.getTitleStyle;

  TextWidget.normal(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow,
  }) : style = textStyle ?? JRLTTextStyles.getNormalStyle;

  TextWidget.small(
    this.text, {
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow,
  }) : style = textStyle ?? JRLTTextStyles.getSmallStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(color: color ?? JRLTColors.blackColor),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
