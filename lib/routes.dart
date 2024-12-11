import 'package:flutter/material.dart';

class Routes {
  static const String login = '/login';
  static const String clientes = '/clientes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => Container());
      case clientes:
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Nenhuma rota encontrada para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
