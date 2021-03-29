import 'models.dart';
///classe que define a Visita
class Visita {
  int id;
  String data;
  String motivo;
  bool ocorrido;
  Professor professor;
  Visitante visitante;

  ///construtor
  Visita(
      {this.id,
      this.data,
      this.motivo,
      this.ocorrido,
      this.professor,
      this.visitante});

  ///converte dados json para o tipo Visita
  Visita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    motivo = json['motivo'];
    ocorrido = json['ocorrido'];
    professor = json['professor'] != null
        ? new Professor.fromJson(json['professor'])
        : null;
    visitante = json['visitante'] != null
        ? new Visitante.fromJson(json['visitante'])
        : null;
  }

  ///converte o tipo Visita para o formato json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['motivo'] = this.motivo;
    data['ocorrido'] = this.ocorrido;
    if (this.professor != null) {
      data['professor'] = this.professor.toJson();
    }
    if (this.visitante != null) {
      data['visitante'] = this.visitante.toJson();
    }
    return data;
  }
}
