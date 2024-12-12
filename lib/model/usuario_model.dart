import 'dart:convert';
import 'package:http/http.dart' as http;

class Usuario {
  int id;
  String nome;
  String senha;

  Usuario({
    required this.id,
    required this.nome,
    required this.senha,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      senha: json['senha'],
    );
  }

  Future<List<Usuario>> getUsuarios() async {
    try {
      final response =
          await http.get(Uri.parse('URLURLURL')); // COLOCAR O URL DA API AQUI
      if (response.statusCode == 200) {
        List<dynamic> usuariosJson = jsonDecode(response.body);
        return usuariosJson.map((json) => Usuario.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erro ${response.statusCode} ao consultar os usuários, contate o SUPORTE!');
      }
    } catch (e) {
      throw Exception(
          'Erro ao acessar o servidor para consultar os usuários, contate o SUPORTE!');
    }
  }
}
