///classe que define o Visitante
class Visitante {
  int id;
  String nome;
  String email;
  String cpf;

  ///construtor
  Visitante({this.id, this.nome, this.email, this.cpf});

  ///converte dados json para o tipo Visitante
  Visitante.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    cpf = json['cpf'];
  }

  ///converte o tipo Visitante para o formato json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    return data;
  }
}