import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/config/jrlt_material.dart';
import 'package:levaetraz/core/extensions/media_query_extension.dart';
import 'package:levaetraz/core/widgets/button/elevated_button_widget.dart';
import 'package:levaetraz/core/widgets/input/text_form_field_widget.dart';
import 'package:levaetraz/core/widgets/sized_box/sized_box_widget.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';

class DestktopLoginPage extends StatefulWidget {
  const DestktopLoginPage({super.key});

  @override
  State<DestktopLoginPage> createState() => _DestktopLoginPageState();
}

class _DestktopLoginPageState extends State<DestktopLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.getWidth * 0.2 + 100),
          child: Stack(children: [
            JRLTMaterial.backgroundImageWidget,
            Center(
                child: Padding(
              padding: const EdgeInsets.all(30),
              child: JRLTMaterial.logoImage,
            ))
          ]),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Card(
                elevation: 10,
                surfaceTintColor: JRLTColors.secundaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 750),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget.title('Acesse sua Conta'),
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
          ),
        )
      ],
    );
  }
}
