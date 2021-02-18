import 'package:controle_de_entrada/conect_API/controllers/visita_controller.dart';
import 'package:controle_de_entrada/widgets/body_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaCadastrados extends GetView<VisitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (controller) {
            return controller.isOnScan
                ? QRCodeResult(controller.result)
                : _buildListView();
          }),
    );
  }

  _buildListView() {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.qr_code_scanner),
        label: Text('Scan'),
        onPressed: () => controller.scanQR(),
      ),
      body: GetBuilder(
        init: controller,
        initState: (state) async => await controller.fetch(),
        builder: (controller) {
          return controller.visitas == null
              ? Center(child: CircularProgressIndicator())
              : _listView(controller);
        },
      ),
    );
  }

  ListView _listView(controller) {
    return ListView.separated(
      itemCount: controller.visitas.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 3.0,
      ),
      itemBuilder: (context, index) {
        return ListTileTheme(
          dense: true,
          child: ExpansionTile(
            title: Text(controller.visitas[index].visitante.nome),
            subtitle: Text('CPF: ${controller.visitas[index].visitante.cpf}'),
            leading: CircleAvatar(
              child: Text(
                  controller.visitas[index].visitante.nome.substring(0, 1)),
              backgroundColor: Colors.indigo,
            ),
            childrenPadding: EdgeInsets.only(left: 30),
            children: [
              _listTile('Nome:', controller.visitas[index].visitante.nome),
              _listTile('Professor Responsável:',
                  controller.visitas[index].professor.nome),
              _listTile('CPF:', controller.visitas[index].visitante.cpf),
              _listTile('E-mail:', controller.visitas[index].visitante.email),
              _listTile('Justificativa para acesso:',
                  controller.visitas[index].motivo),
              _listTile('Data requerida:', controller.visitas[index].data),
              _listTile(
                  'Ocorrido:', controller.visitas[index].ocorrido.toString()),
            ],
          ),
        );
      },
    );
  }

  _listTile(String title, String subTitle) {
    if (subTitle == 'true') {
      subTitle = 'Sim';
    } else if (subTitle == 'false') {
      subTitle = 'Não';
    }
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
