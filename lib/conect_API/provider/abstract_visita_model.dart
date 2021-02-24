import 'package:controle_de_entrada/conect_API/model/visita.dart';

abstract class AbstractVisitaProvider {
  Future<List<VisitaModel>> fetchVisita();
  Future<VisitaModel> fetchById(int id);
  Future<VisitaModel> updateStatusOcorrido(int id);
  Future<List<VisitaModel>> listaOcorridos();
  Future<List<VisitaModel>> listaNaoOcorridos();
}