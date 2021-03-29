import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';

///classe que controla as informações scaneadas
class ScanController extends GetxController {
  ///recebe dados do repositório de Visita
  VisitaRepository repository;

  ///Construtor da classe
  ScanController({@required this.repository});

  ///recebe dados relacionados a visita scaneada
  Visita _visita;
  Visita get visita => this._visita;

  ///flag de controle de autorização
  bool _flagAutorizar = false;
  bool get flagAutorizar => this._flagAutorizar;
  set flagAutorizar(bool value) {
    _flagAutorizar = value;
    update();
  }

  ///busca no repositorio de visitas a visita passada por parametro "id"
  Future<void> fetchById(int id) async {
    final visita = await this.repository.fetchById(id);
    this._visita = visita;
    update();
  }

  ///altera o status(ocorrido/naoOcorrido) da visita passada por parametro id
  Future<void> atualizaStatusOcorrido(int id) async {
    this._visita = await this.repository.updateStatusOcorrido(id);
    update();
  }
}
