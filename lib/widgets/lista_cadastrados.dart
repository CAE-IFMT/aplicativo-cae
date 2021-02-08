import 'package:controle_de_entrada/conect_API/controllers/PessoaController.dart';
import 'package:controle_de_entrada/pages/informacoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaCadastrados extends GetView<PessoaController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _buildListView(),
    );
  }

  _buildListView() {
    return GetBuilder(
        init: controller,
        initState: (state) => controller.fetch(),
        builder: (controller) {
          return ListView.separated(
            itemCount: controller.pessoas.length,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 3.0,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.pessoas[index].name),
                subtitle: Text('CPF: ${controller.pessoas[index].cpf}'),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DadosPessoa(
                        controller.pessoas[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        });
  }
}
