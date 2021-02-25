import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../models/models.dart';
import 'providers.dart';

const api = 'https://cae-ifmt.herokuapp.com';

class VisitaProvider implements AbstractVisitaProvider {
  final Dio dio;

  VisitaProvider({@required this.dio});

  @override
  Future<List<Visita>> fetchVisita() async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";
    final response = await dio.get('$api/visitas');
    final visitaModel =
        response.data.map<Visita>((data) => Visita.fromJson(data)).toList();
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro método GET');
      throw Exception('Erro  método GET');
    }
  }

  @override
  Future<Visita> fetchById(int id) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";
    final response = await dio.get('$api/visitas/$id');
    final visitaModel = Visita.fromJson(response.data);
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro  método GET');
      throw Exception('Erro  método GET');
    }
  }

  @override
  Future<Visita> updateStatusOcorrido(int id) async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer ${tokenBox}";
    final response = await dio.put('$api/visitas/$id/ocorrida');
    final visitaModel = Visita.fromJson(response.data);
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro  método GET');
      throw Exception('Erro  método GET');
    }
  }

  @override
  Future<List<Visita>> listaNaoOcorridos() async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";
    final response = await dio.get('$api/visitas/naoOcorridas');
    final visitaModel =
        response.data.map<Visita>((data) => Visita.fromJson(data)).toList();
    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro método GET');
      throw Exception('Erro  método GET');
    }
  }

  @override
  Future<List<Visita>> listaOcorridos() async {
    GetStorage box = GetStorage();
    String tokenBox = box.read('token');
    dio.options.headers["Authorization"] = "Bearer $tokenBox";

    final response = await dio.get('$api/visitas/ocorridas');
    final visitaModel =
        response.data.map<Visita>((data) => Visita.fromJson(data)).toList();

    if (response.statusCode == 200) {
      return visitaModel;
    } else {
      print('Erro método GET');
      throw Exception('Erro  método GET');
    }
  }
}
