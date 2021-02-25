import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class VisitaRepository {
  final AbstractVisitaProvider provider;

  VisitaRepository({@required this.provider});

  Future<List<Visita>> fetchVisita() async {
    return await this.provider.fetchVisita();
  }

  Future<Visita> fetchById(int id) async {
    return await this.provider.fetchById(id);
  }

  Future<Visita> updateStatusOcorrido(int id) async {
    return await this.provider.updateStatusOcorrido(id);
  }

  Future<List<Visita>> listaOcorridos() async {
    return await this.provider.listaOcorridos();
  }

  Future<List<Visita>> listaNaoOcorridos() async {
    return await this.provider.listaNaoOcorridos();
  }
}
