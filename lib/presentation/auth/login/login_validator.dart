// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:levaetraz/core/functions/show_snackbar_function.dart';

class LoginValidator {
  static final LoginValidator _singleton = LoginValidator._internal();

  factory LoginValidator() {
    return _singleton;
  }

  LoginValidator._internal();

  void validar(
      {required String usuario,
      required String senha,
      required BuildContext context,
      required Function(bool) setIsLoading}) async {
    setIsLoading(true);
    final response = await validarLogin(usuario: usuario, senha: senha);

    if (response['valido'] == false) {
      mostrarSnackbar(
          context: context, mensagem: response['mensagem'], isError: true);
      setIsLoading(false);
      return;
    }
    setIsLoading(false);
    mostrarSnackbar(
        context: context, mensagem: response['mensagem'], isError: false);
  }

  Future<Map<String, dynamic>> validarLogin(
      {required String usuario, required String senha}) async {
    if (usuario.isEmpty) {
      return {'valido': false, 'mensagem': 'O usuário não pode ser vazio!'};
    }
    if (senha.isEmpty) {
      return {'valido': false, 'mensagem': 'A senha não pode ser vazia!'};
    }

    try {
      final response =
          await http.post(Uri.parse('${dotenv.env['API_URL']}/login'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'usuario': usuario,
                'senha': senha,
              }));
      if (response.statusCode == 200) {
        return {'valido': true, 'mensagem': 'Usuário autenticado com sucesso!'};
      }
      if (response.statusCode == 401) {
        return {'valido': false, 'mensagem': 'Usuário ou senha inválidos!'};
      } else {
        return {
          'valido': false,
          'mensagem': 'Erro ${response.statusCode} ao autenticar o usuário!'
        };
      }
    } catch (e) {
      return {
        'valido': false,
        'mensagem': 'Erro ao se comunicar com o servidor, contate o SUPORTE!'
      };
    }
  }
}
