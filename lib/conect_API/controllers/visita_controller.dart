import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:controle_de_entrada/conect_API/repository/visita_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VisitaController extends GetxController {
  var _visitas = List<VisitaModel>();
  VisitaRepository repository;

  VisitaController({@required this.repository});

  Future<VisitaModel> fetch() async{
    final visitas = await this.repository.fetchVisita();
    this._visitas = visitas;
    update();
  }

  List<VisitaModel> get visitas => this._visitas;
}