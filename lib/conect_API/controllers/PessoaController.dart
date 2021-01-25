import 'package:controle_de_entrada/conect_API/model/pessoa.dart';
import 'package:controle_de_entrada/conect_API/repository/pessoa_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PessoaController extends GetxController {
  var _pessoas = List<PessoaModel>();
  PessoaRepository repository;

  PessoaController({@required this.repository});

  Future<PessoaModel> fetch() async{
      final pessoas = await this.repository.fetchPessoa();
      this._pessoas = pessoas;
      update();
  }

  List<PessoaModel> get pessoas => this._pessoas;
}