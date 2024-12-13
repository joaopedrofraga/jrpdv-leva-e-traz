import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final String label;
  final Function() onPressed;
  final bool isPrimary;
  final double height;
  final double width;
  final bool isLoading;
  const ElevatedButtonWidget(
      {super.key,
      required this.label,
      this.onPressed = defaultOnPressed,
      this.isPrimary = true,
      this.height = 55,
      this.width = double.infinity,
      this.isLoading = false});

  static void defaultOnPressed() {}

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: widget.isPrimary
                ? JRLTColors.primaryColor
                : JRLTColors.secundaryColor),
        child: widget.isLoading
            ? const LinearProgressIndicator()
            : TextWidget.bold(widget.label,
                color: widget.isPrimary
                    ? JRLTColors.secundaryColor
                    : JRLTColors.primaryColor),
      ),
    );
  }
}
