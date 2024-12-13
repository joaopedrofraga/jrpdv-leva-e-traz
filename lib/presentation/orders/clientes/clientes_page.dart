import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/widgets/text/text_widget.dart';
import 'package:levaetraz/model/cliente_model.dart';
import 'package:levaetraz/routes.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  List<Cliente> todosClientes = [];
  String? errorMessage;

  Future<void> buscarClientes() async {
    try {
      final data = await fetchClientes();
      if (mounted) {
        setState(() {
          todosClientes = data;
          errorMessage = null;
        });
      }
    } catch (e) {
      print('$e');
      if (mounted) {
        setState(() {
          errorMessage = e.toString();
        });
      }
    }
  }

  @override
  void initState() {
    buscarClientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: JRLTColors.primaryColor,
            title: TextWidget.title('SELECIONE O CLIENTE',
                color: JRLTColors.secundaryColor),
            leading: IconButton(
                icon: Icon(Icons.logout, color: JRLTColors.secundaryColor),
                tooltip: 'Sair',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.login, (route) => false);
                })),
        body: errorMessage != null
            ? Center(
                child: TextWidget.normal(
                    'Ocorreu um erro ao consultar os clientes, contate o SUPORTE!'))
            : todosClientes.isEmpty
                ? Center(child: TextWidget.normal('Nenhum cliente encontrado.'))
                : ListView.builder(itemBuilder: (context, index) {
                    return ExpansionTile(
                        title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget.bold(
                            todosClientes[index].nome.toUpperCase()),
                        TextWidget.normal(todosClientes[index].cnpfCpf ?? '')
                      ],
                    ));
                  }));
  }
}
