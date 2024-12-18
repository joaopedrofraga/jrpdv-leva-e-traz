import 'package:flutter/material.dart';
import 'package:levaetraz/core/config/jrlt_colors.dart';
import 'package:levaetraz/core/widgets/button/elevated_button_widget.dart';
import 'package:levaetraz/core/widgets/input/text_form_field_widget.dart';
import 'package:levaetraz/core/widgets/sized_box/sized_box_widget.dart';
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
  List<Cliente> clientesFiltrados = [];
  TextEditingController searchController = TextEditingController();
  String? errorMessage;

  Future<void> buscarClientes() async {
    try {
      final data = await fetchClientes();
      if (mounted) {
        setState(() {
          todosClientes = data;
          clientesFiltrados = data;
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

  void buscarResultadosDaBusca() {
    final query = searchController.text.toUpperCase();
    setState(() {
      clientesFiltrados = todosClientes.where((cliente) {
        final nome = cliente.nome.toUpperCase();
        return nome.contains(query);
      }).toList();
    });
  }

  bool isNull(dynamic data) {
    return data == null || data == '' || data.isEmpty;
  }

  @override
  void dispose() {
    searchController.removeListener(buscarResultadosDaBusca);
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    buscarClientes();
    searchController.addListener(buscarResultadosDaBusca);
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWidget(
                  controller: searchController, inputLabel: 'Buscar Cliente'),
            ),
            errorMessage != null
                ? Center(
                    child: TextWidget.normal(
                        'Ocorreu um erro ao consultar os clientes, contate o SUPORTE!'))
                : todosClientes.isEmpty
                    ? Center(
                        child: TextWidget.normal('Nenhum cliente encontrado.'))
                    : Flexible(
                        child: ListView.builder(
                            itemCount: clientesFiltrados.length,
                            itemBuilder: (context, index) {
                              Cliente cliente = clientesFiltrados[index];
                              return ExpansionTile(
                                title:
                                    TextWidget.bold(cliente.nome.toUpperCase()),
                                subtitle: isNull(cliente.cnpfCpf)
                                    ? null
                                    : TextWidget.normal(cliente.cnpfCpf!),
                                expandedAlignment: Alignment.centerLeft,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget.normal(
                                              'CÓDIGO:     ${cliente.codigo}'),
                                          if (!isNull(cliente.fantasia))
                                            const Divider(),
                                          if (!isNull(cliente.fantasia))
                                            TextWidget.normal(
                                                'FANTASIA:     ${cliente.fantasia}'),
                                          if (!isNull(cliente.cep))
                                            const Divider(),
                                          if (!isNull(cliente.cep))
                                            TextWidget.normal(
                                                'CEP:     ${cliente.cep}'),
                                          if (!isNull(cliente.cidade))
                                            const Divider(),
                                          if (!isNull(cliente.cidade))
                                            TextWidget.normal(
                                                'CIDADE:     ${cliente.cidade}'),
                                          if (!isNull(cliente.bairro))
                                            const Divider(),
                                          if (!isNull(cliente.bairro))
                                            TextWidget.normal(
                                                'BAIRRO:     ${cliente.bairro}'),
                                          if (!isNull(cliente.endereco))
                                            const Divider(),
                                          if (!isNull(cliente.endereco))
                                            TextWidget.normal(
                                                'ENDEREÇO:     ${cliente.endereco}'),
                                          if (!isNull(cliente.numero))
                                            const Divider(),
                                          if (!isNull(cliente.numero))
                                            TextWidget.normal(
                                                'NÚMERO:     ${cliente.numero}'),
                                          if (!isNull(cliente.complemento))
                                            const Divider(),
                                          if (!isNull(cliente.complemento))
                                            TextWidget.normal(
                                                'COMPLEMENTO:     ${cliente.complemento}'),
                                          if (!isNull(cliente.telefone))
                                            const Divider(),
                                          if (!isNull(cliente.telefone))
                                            TextWidget.normal(
                                                'TELEFONE:     ${cliente.telefone}'),
                                          if (!isNull(cliente.celular))
                                            const Divider(),
                                          if (!isNull(cliente.celular))
                                            TextWidget.normal(
                                                'CELULAR:     ${cliente.celular}'),
                                          const Divider(),
                                          const SizedBoxWidget.md(),
                                          ElevatedButtonWidget(
                                              label: 'GERAR ENTREGA/COLETA',
                                              onPressed: () {}),
                                        ]),
                                  ),
                                ],
                              );
                            }),
                      ),
          ],
        ));
  }
}
