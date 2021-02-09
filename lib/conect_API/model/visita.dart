import 'package:controle_de_entrada/conect_API/model/professor.dart';
import 'package:controle_de_entrada/conect_API/model/visitante.dart';
import 'package:intl/intl.dart';

class VisitaModel {
  int id;
  DateTime data;
  String motivo;
  bool ocorrido;
  Professor professor;
  Visitante visitante;

  VisitaModel(
      {this.id,
      this.data,
      this.motivo,
      this.ocorrido,
      this.professor,
      this.visitante});

  VisitaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data =  DateTime.parse(json['data'].toString());
    motivo = json['motivo'];
    ocorrido = json['ocorrido'];
    professor = json['professor'] != null
        ? new Professor.fromJson(json['professor'])
        : null;
    visitante = json['visitante'] != null
        ? new Visitante.fromJson(json['visitante'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] =this.data;
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
