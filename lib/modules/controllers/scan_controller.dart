import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';

class ScanController extends GetxController {
  VisitaRepository repository;

  ScanController({@required this.repository});

  Visita _visita;

  Visita get visita => this._visita;

  bool _flagAutorizar = false;

  bool get flagAutorizar => this._flagAutorizar;

  set flagAutorizar(bool value) {
    _flagAutorizar = value;
    update();
  }

  Future<void> fetchById(int id) async {
    final visita = await this.repository.fetchById(id);
    this._visita = visita;
    update();
  }

  Future<void> atualizaStatusOcorrido(int id) async {
    this._visita = await this.repository.updateStatusOcorrido(id);
    update();
  }
}
