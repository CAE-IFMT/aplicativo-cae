import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import 'abstract_visita_model.dart';

const api = 'https://cae-ifmt.herokuapp.com'; //'http://192.168.0.106:5000';

class VisitaProvider implements AbstractVisitaProvider {
  final Dio dio;

  VisitaProvider({@required this.dio});

  @override
  Future<List<VisitaModel>> fetchVisita() async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer ${tokenBox}";
    final response = await dio.get('$api/visitas');
    final visitaModel = response.data
        .map<VisitaModel>((data) => VisitaModel.fromJson(data))
        .toList();
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro método GET');
      throw Exception('Erro  método GET');
    }
  }

  @override
  Future<VisitaModel> fetchById(int id) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer ${tokenBox}";
    final response = await dio.get('$api/visitas/$id');
    final visitaModel = VisitaModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro  método GET');
      throw Exception('Erro  método GET');
    }
  }

  @override
  Future<VisitaModel> updateStatusOcorrido(int id) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer ${tokenBox}";
    final response = await dio.put('$api/visitas/$id/ocorrido');
    final visitaModel = VisitaModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro  método GET');
      throw Exception('Erro  método GET');
    }
  }
}
