import 'dart:convert';

PessoaModel pessoaFromJson(String str) => PessoaModel.fromJson(json.decode(str));

String pessoaToJson(PessoaModel data) => json.encode(data.toJson());

class PessoaModel {
  PessoaModel({
    this.id,
    this.name,
    this.email,
    this.professorResponsavel,
    this.cpf,
    this.data,
  });

  int id;
  String name;
  String email;
  String professorResponsavel;
  String cpf;
  DateTime data;

  factory PessoaModel.fromJson(Map<String, dynamic> json) => PessoaModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    professorResponsavel: json["professorResponsavel"],
    cpf: json["cpf"],
    data: DateTime.parse(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "professorResponsavel": professorResponsavel,
    "cpf": cpf,
    "data": data.toIso8601String(),
  };
}
