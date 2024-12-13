import 'package:flutter/material.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';
import 'package:levaetraz/presentation/auth/login/login_page.dart';
import 'package:levaetraz/presentation/orders/clientes/clientes_page.dart';

class Routes {
  static const String login = '/login';
  static const String clientes = '/clientes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case clientes:
        return MaterialPageRoute(builder: (_) => const ClientesPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: TextWidget.bold(
                  'Nenhuma rota encontrada para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
