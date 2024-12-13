import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/config/jrlt_text_styles.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String inputLabel;
  final FocusNode? focusNode;
  final bool isPassword;
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.inputLabel,
      this.focusNode,
      this.isPassword = false});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool ocultarSenha = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: JRLTTextStyles.getNormalStyle,
      obscureText: widget.isPassword ? ocultarSenha : false,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                      ocultarSenha ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      ocultarSenha = !ocultarSenha;
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          label: TextWidget.bold(widget.inputLabel),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: JRLTColors.primaryColor))),
    );
  }
}
