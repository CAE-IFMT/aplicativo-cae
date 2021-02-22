import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:controle_de_entrada/conect_API/repository/visita_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  VisitaRepository repository;
  ScanController({@required this.repository});

  VisitaModel _visita;
  VisitaModel get visita => this._visita;

  Future<VisitaModel> fetchById(int id) async {
    final visita = await this.repository.fetchById(id);
    this._visita = visita;
    update();
  }

  Future atualizaStatusOcorrido(int id) async {
    this._visita = await this.repository.updateStatusOcorrido(id);
    update();
  }
}