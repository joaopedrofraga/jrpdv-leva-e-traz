import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/config/jrlt_material.dart';
import 'package:levaetraz/core/extensions/media_query_extension.dart';
import 'package:levaetraz/core/widgets/button/elevated_button_widget.dart';
import 'package:levaetraz/core/widgets/input/text_form_field_widget.dart';
import 'package:levaetraz/core/widgets/sized_box/sized_box_widget.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        JRLTMaterial.backgroundImageWidget,
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Card(
              elevation: 10,
              surfaceTintColor: JRLTColors.secundaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: context.getWidth * 0.1 + 150),
                          child: JRLTMaterial.logoImage),
                      const SizedBoxWidget.lg(),
                      TextFormFieldWidget(
                          controller: TextEditingController(),
                          inputLabel: 'Usuário'),
                      const SizedBoxWidget.lg(),
                      TextFormFieldWidget(
                          controller: TextEditingController(),
                          inputLabel: 'Senha'),
                      const SizedBoxWidget.xl(),
                      const ElevatedButtonWidget(
                          label: 'RECARREGAR USUÁRIOS',
                          isPrimary: false,
                          height: 35),
                      const SizedBoxWidget.md(),
                      const ElevatedButtonWidget(label: 'ENTRAR'),
                      const SizedBoxWidget.xxxl(),
                      TextWidget.small('jrpdv.com.br ( 47 3393 - 6088 )')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
