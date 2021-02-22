import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:controle_de_entrada/conect_API/provider/abstract_visita_model.dart';
import 'package:flutter/cupertino.dart';

class VisitaRepository {
  final AbstractVisitaProvider provider;

  VisitaRepository({@required this.provider});

  Future<List<VisitaModel>> fetchVisita() async {
    return await this.provider.fetchVisita();
  }

  Future<VisitaModel> fetchById(int id) async {
    return await this.provider.fetchById(id);
  }

  Future<VisitaModel> updateStatusOcorrido(int id) async{
    return await this.provider.updateStatusOcorrido(id);
  }
}