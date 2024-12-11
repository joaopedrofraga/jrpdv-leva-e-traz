import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          JRLTMaterial.backgroundImageWidget,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Login'),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Usuário'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/clientes');
                        },
                        child: const Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
