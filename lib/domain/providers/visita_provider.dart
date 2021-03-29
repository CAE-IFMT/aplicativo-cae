import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../models/models.dart';
import 'providers.dart';

///link que buca o servidor na nuvem
const api = 'https://cae-ifmt.herokuapp.com';

class VisitaProvider implements AbstractVisitaProvider {

  ///responsável pela comunicação Http
  final Dio dio;

  ///contrutor
  VisitaProvider({@required this.dio});


  ///metodo responsavel por recebe a lista de visitas do sevidor
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

  ///método que busca visita pelo id passado
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

  ///método que altera o status da visita passada pelo id
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

  ///metodo responsavel por recebe a lista de visitas não ocorridas do sevidor
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

  ///metodo responsavel por recebe a lista de visitas  ocorridas do sevidor
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
