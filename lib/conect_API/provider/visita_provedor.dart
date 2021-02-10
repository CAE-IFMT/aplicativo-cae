import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'abstract_visita_model.dart';

const api = 'http://192.168.0.106:5000';

class VisitaProvider implements AbstractVisitaProvider{
  final Dio dio;

  VisitaProvider({@required this.dio});

  @override
  Future<List<VisitaModel>> fetchVisita() async {
    final response = await dio.get('$api/visitas');
    final visitaModel = response.data.map<VisitaModel>((data) => VisitaModel.fromJson(data)).toList();
    print(visitaModel);
    print(response.data);
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro  método GET');
      throw Exception('Erro  método GET');
    }
  }
}