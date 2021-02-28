import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/models.dart';
import '../controllers/controllers.dart';
import '../routes/routes.dart';

class QRCodeResult extends GetView<ScanController> {
  final String visitaModelString;

  QRCodeResult(this.visitaModelString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        initState: (state) async => await controller.fetchById(_converteStringToObject(visitaModelString).id),
        builder: (controller) {
          return controller.visita == null
              ? Center(child: CircularProgressIndicator())
              : _detalhes(controller);
        },
      ),
    );
  }

  _detalhes(ScanController controller) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 50.0, left: 20.0,top: 10.0),
          child: Column(
            children: [
              _listTile('Nome:', controller.visita.visitante.nome),
              _listTile(
                  'Professor Responsável:', controller.visita.professor.nome),
              _listTile('CPF:', controller.visita.visitante.cpf),
              _listTile('E-mail:', controller.visita.visitante.email),
              _listTile('Justificativa para acesso:', controller.visita.motivo),
              _listTile('Data requerida:', controller.visita.data),
            ],
          ),
        ),
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
    await visitaController.fetch('ocorrido');
    await visitaController.fetch('naoOcorrido');
    controller.flagAutorizar = false;
    Get.toNamed(Routes.HOME);
  }

  Visita _converteStringToObject(String result) {
    return Visita.fromJson(jsonDecode(result));
  }

  _listTile(String title, String subTitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
