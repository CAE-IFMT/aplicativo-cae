import 'package:controle_de_entrada/conect_API/model/pessoa.dart';
import 'package:controle_de_entrada/conect_API/provider/abstract_pessoa_model.dart';
import 'package:meta/meta.dart';


class PessoaRepository {
  final AbstractPessoaProvider provider;

  PessoaRepository({@required this.provider});

  Future<List<PessoaModel>> fetchPessoa() async {
    return await this.provider.fetchPessoa();
  }
}