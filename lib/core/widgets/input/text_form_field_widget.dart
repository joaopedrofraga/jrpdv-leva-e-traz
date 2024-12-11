import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/config/jrlt_text_styles.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String inputLabel;
  final FocusNode? focusNode;
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.inputLabel,
      this.focusNode});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: JRLTTextStyles.getNormalStyle,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: TextWidget.bold(widget.inputLabel),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: JRLTColors.primaryColor))),
    );
  }
}
