import 'package:controle_de_entrada/conect_API/controllers/visita_controller.dart';
import 'package:controle_de_entrada/pages/informacoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaCadastrados extends GetView<VisitaController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListView(),
    );
  }

  _buildListView() {
    return GetBuilder(
      init: controller,
      initState: (state) => controller.fetch(),
      builder: (controller) {
        return ListView.separated(
          itemCount: controller.visitas.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 3.0,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.visitas[index].visitante.nome),
              subtitle: Text('CPF: ${controller.visitas[index].visitante.cpf}'),
              leading: CircleAvatar(
                child: Text(
                    controller.visitas[index].visitante.nome.substring(0, 1)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DadosPessoa(
                      visitaModel: controller.visitas[index],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
