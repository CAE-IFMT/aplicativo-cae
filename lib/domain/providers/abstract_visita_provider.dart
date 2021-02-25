import '../models/models.dart';

abstract class AbstractVisitaProvider {
  Future<List<Visita>> fetchVisita();
  Future<Visita> fetchById(int id);
  Future<Visita> updateStatusOcorrido(int id);
  Future<List<Visita>> listaOcorridos();
  Future<List<Visita>> listaNaoOcorridos();
}
