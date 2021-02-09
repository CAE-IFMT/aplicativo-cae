import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DadosPessoa extends StatefulWidget {
  final VisitaModel visitaModel;

  DadosPessoa({this.visitaModel});

  @override
  _DadosPessoa createState() => _DadosPessoa();
}

class _DadosPessoa extends State<DadosPessoa> {
  @override
  Widget build(BuildContext context) {
    VisitaModel _visitaModel =
        VisitaModel.fromJson(widget.visitaModel.toJson());
    return AlertDialog(
      backgroundColor: Colors.amber,
      title: Text(
        'Informações de Requisição',
        textAlign: TextAlign.center,
      ),
      content: ListView(
        itemExtent: 60.0,
        children: [
          _listTile('Nome:', _visitaModel.visitante.nome),
          _listTile('Professor Responsável:', _visitaModel.professor.nome),
          _listTile('CPF:', _visitaModel.visitante.cpf),
          _listTile('E-mail:', _visitaModel.visitante.email),
          _listTile('Justificativa para acesso:', _visitaModel.motivo),
          _listTile(
              'Data requerida:',
              DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_BR')
                  .format(_visitaModel.data)),
          _listTile('Concluido:', _visitaModel.ocorrido.toString()),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("OK"),
          color: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _listTile(String title, String subTitle) {
    if (subTitle == 'true') {
      subTitle = 'Sim';
    } else if (subTitle == 'false') {
      subTitle = 'Não';
    }
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
