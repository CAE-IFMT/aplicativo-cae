import 'package:controle_de_entrada/conect_API/controllers/visita_controller.dart';
import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:controle_de_entrada/widgets/body_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaCadastrados extends GetView<VisitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: controller,
          initState: (state) async => await controller.fetch(),
          builder: (controller) {
            return controller.isOnScan
                ? QRCodeResult(controller.result)
                : _buildListView(controller);
          }),
    );
  }

  _buildListView(VisitaController controller) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
            bottom: TabBar(
          tabs: <Widget>[Tab(text: 'Cadastrados'), Tab(text: 'Ocorridos')],
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.qr_code_scanner),
        label: Text('Scan'),
        onPressed: () => controller.scanQR(),
      ),
       body: TabBarView(
        children: <Widget>[
          controller.listNaoOcorridos == null
              ? Center(child: CircularProgressIndicator())
              : _listView(controller.listNaoOcorridos),
          controller.listOcorridos == null
              ? Center(child: CircularProgressIndicator())
              : _listView(controller.listOcorridos),
        ],
      ),
    );
  }

  ListView _listView(List<VisitaModel> visitas) {
    return ListView.separated(
      itemCount: visitas.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 3.0,
      ),
      itemBuilder: (context, index) {
        return ListTileTheme(
          dense: true,
          child: ExpansionTile(
            title: Text(visitas[index].visitante.nome),
            subtitle: Text('CPF: ${visitas[index].visitante.cpf}'),
            leading: CircleAvatar(
              child: Text(
                  visitas[index].visitante.nome.substring(0, 1)),
              backgroundColor: Colors.indigo,
            ),
            childrenPadding: EdgeInsets.only(left: 30),
            children: [
              _listTile('Nome:', visitas[index].visitante.nome),
              _listTile('Professor Responsável:',
                  visitas[index].professor.nome),
              _listTile('CPF:', visitas[index].visitante.cpf),
              _listTile('E-mail:', visitas[index].visitante.email),
              _listTile('Justificativa para acesso:',
                  visitas[index].motivo),
              _listTile('Data requerida:', visitas[index].data),
            ],
          ),
        );
      },
    );
  }

  _listTile(String title, String subTitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
