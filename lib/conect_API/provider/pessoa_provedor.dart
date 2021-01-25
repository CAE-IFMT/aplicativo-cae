import 'package:controle_de_entrada/conect_API/model/pessoa.dart';
import 'package:controle_de_entrada/conect_API/provider/abstract_pessoa_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const api = 'http://192.168.0.106:8080';

class PessoaProvider implements AbstractPessoaProvider{
  final Dio dio;

  PessoaProvider({@required this.dio});

  @override
  Future<List<PessoaModel>> fetchPessoa() async {
    final response = await dio.get('$api/pessoas');
    final pessoaModel = response.data.map<PessoaModel>((data) => PessoaModel.fromJson(data)).toList();
  print(pessoaModel);
  print(response.data);
    if (response.statusCode == 200) {
      return pessoaModel;
    } else {
      print('Erro  método GET');
      throw Exception('Erro  método GET');
    }
  }
}
