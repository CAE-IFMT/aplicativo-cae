import 'package:controle_de_entrada/conect_API/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DadosPessoa extends StatelessWidget {
  final PessoaModel pessoa;


  DadosPessoa(this.pessoa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Informações Cadastradas'),
       backgroundColor: Colors.black12,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          ListBody(
            mainAxis: Axis.vertical,
            reverse: false,
            children: <Widget>[
              _container('Nome: ${pessoa.name}'),
              _container('Professor Responsavel: ${pessoa.professorResponsavel}'),
              _container('Cpf: ${pessoa.cpf}'),
              _container('Email: ${pessoa.email}'),
              _container('Data: ${DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_BR').format(pessoa.data)}'),
            ],
          )
        ],
      ),
    );
  }


  _container(String string){
    return Container(
      child: Text(
        string,
        style: new TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, color: Colors.black12),
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      padding: EdgeInsets.all(10),
    );
  }
}
