///classe que define o Professor
class Professor {
  int id;
  String nome;
  String email;

  ///construtor
  Professor({this.id, this.nome, this.email});

  ///converte dados json para o tipo Professor
  Professor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
  }

  ///converte o tipo Professor para o formato json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    return data;
  }
}