import 'package:controle_de_entrada/conect_API/model/pessoa.dart';

abstract class AbstractPessoaProvider {
  Future<List<PessoaModel>> fetchPessoa();
}