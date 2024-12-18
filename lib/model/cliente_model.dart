import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Cliente {
  int id;
  String codigo;
  String nome;
  String? fantasia;
  String? cep;
  String? cidade;
  String? bairro;
  String? endereco;
  String? numero;
  String? complemento;
  String? cnpfCpf;
  String? telefone;
  String? celular;

  Cliente({
    required this.id,
    required this.codigo,
    required this.nome,
    required this.fantasia,
    required this.cep,
    required this.cidade,
    required this.bairro,
    required this.endereco,
    required this.numero,
    required this.complemento,
    required this.cnpfCpf,
    required this.telefone,
    required this.celular,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      codigo: json['codigo'],
      nome: json['nome'],
      fantasia: json['fantasia'],
      cep: json['cep'],
      cidade: json['cidade'],
      bairro: json['bairro'],
      endereco: json['endereco'],
      numero: json['numender'],
      complemento: json['complemento'],
      cnpfCpf: json['cnpj_cpf'],
      telefone: json['fone'],
      celular: json['celular'],
    );
  }
}

Future<List<Cliente>> fetchClientes() async {
  try {
    final response =
        await http.get(Uri.parse('${dotenv.env['API_URL']}/clientes'));
    if (response.statusCode == 200) {
      List<dynamic> clientesJson = jsonDecode(response.body);
      return clientesJson.map((json) => Cliente.fromJson(json)).toList();
    } else {
      throw Exception(
          'Erro ${response.statusCode} ao tentar consultar os clientes');
    }
  } catch (e) {
    throw Exception(
        'Erro ao se comunicar com o servidor para consultar os clientes, contate o SUPORTE!');
  }
}
