import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import '../providers/providers.dart';

///
class VisitaRepository {
  final AbstractVisitaProvider provider;

  VisitaRepository({@required this.provider});

  ///metodo que recebe a lista de visitas, vindo do provedor
  Future<List<Visita>> fetchVisita() async {
    return await this.provider.fetchVisita();
  }

  ///metodo que recebe a visita passada por id, vindo do provedor
  Future<Visita> fetchById(int id) async {
    return await this.provider.fetchById(id);
  }

  ///metodo que altera o status da visita passado por id, vindo do provedor
  Future<Visita> updateStatusOcorrido(int id) async {
    return await this.provider.updateStatusOcorrido(id);
  }

  ///metodo que recebe a lista de visitas ocorridas, vindo do provedor
  Future<List<Visita>> listaOcorridos() async {
    return await this.provider.listaOcorridos();
  }

  ///metodo que recebe a lista de visitas não ocorridas, vindo do provedor
  Future<List<Visita>> listaNaoOcorridos() async {
    return await this.provider.listaNaoOcorridos();
  }
}
