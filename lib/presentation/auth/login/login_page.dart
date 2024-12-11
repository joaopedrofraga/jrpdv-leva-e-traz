import 'package:flutter/material.dart';
import 'package:levaetraz/presentation/auth/login/desktop_login_page.dart';
import 'package:levaetraz/presentation/auth/login/mobile_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 750) {
          return const MobileLoginPage();
        } else {
          return const DestktopLoginPage();
        }
      },
    ));
  }
}
