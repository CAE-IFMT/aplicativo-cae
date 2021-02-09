import 'package:controle_de_entrada/conect_API/model/visita.dart';

abstract class AbstractVisitaProvider {
  Future<List<VisitaModel>> fetchVisita();
}