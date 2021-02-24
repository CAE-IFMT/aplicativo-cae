import 'dart:convert';
import 'package:controle_de_entrada/conect_API/controllers/scan_controller.dart';
import 'package:controle_de_entrada/conect_API/controllers/visita_controller.dart';
import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QRCodeResult extends GetView<ScanController> {
  VisitaModel visitaModel;

  QRCodeResult(result) {
    this.visitaModel = _converteStringToObject(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        initState: (state) async => await controller.fetchById(visitaModel.id),
        builder: (controller) {
          return controller.visita == null
              ? Center(child: CircularProgressIndicator())
              : _detalhes(controller);
        },
      ),
    );
  }

  Card _detalhes(ScanController controller) {
    return Card(
      child: Column(
        children: [
          _listTile('Nome:', controller.visita.visitante.nome),
          _listTile('Professor Responsável:', controller.visita.professor.nome),
          _listTile('CPF:', controller.visita.visitante.cpf),
          _listTile('E-mail:', controller.visita.visitante.email),
          _listTile('Justificativa para acesso:', controller.visita.motivo),
          _listTile('Data requerida:', controller.visita.data),
          _listTile('Ocorrido:', controller.visita.ocorrido.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red)),
                  child: Text(
                    'Voltar',
                    style: TextStyle(color: Colors.white, fontSize: 17.0),

                  ),
                  color: Colors.red,
                  onPressed: () {
                    _returnHome();
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.green)),
                  child: _flagAutorizar(controller.flagAutorizar),
                  color: Colors.green,
                  onPressed: () async {
                    controller.flagAutorizar = true;
                    await controller
                        .atualizaStatusOcorrido(controller.visita.id);
                    await _returnHome();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _flagAutorizar(bool flag) {
    if (!flag) {
      return Text(
        'Autorizar',
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      );
    } else {
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ));
    }
  }

  Future<void> _returnHome() async {
    VisitaController visitaController = Get.find();
    visitaController.isOnScan = false;
    await visitaController.fetch();
    controller.flagAutorizar = false;
    Get.toNamed(Routes.HOME);
  }

  VisitaModel _converteStringToObject(String result) {
    return VisitaModel.fromJson(jsonDecode(result));
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
