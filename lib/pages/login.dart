import 'package:controle_de_entrada/conect_API/login_api.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:controle_de_entrada/widgets/button.dart';
import 'package:controle_de_entrada/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _login = TextEditingController();
  final _senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira o debug da telas
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Controle de Acesso IFMT'),
          centerTitle: true,
          textTheme: Theme
              .of(context)
              .textTheme
              .apply(bodyColor: Colors.black),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 125,
              child: Image.asset("images/login.png"),
            ),
            AppText(
              'Usuário ',
              'Informe o Usuário',
              controller: _login,
              validator: _validateLogin,
            ),
            SizedBox(height: 10),
            AppText(
              'Senha',
              'Informe a Senha',
              password: true,
              controller: _senha,
              validator: _validateSenha,
            ),
            SizedBox(height: 10),
            AppButton(
              'Entrar',
              onPressed: _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    String login = _login.text;
    String senha = _senha.text;

    if (!_formKey.currentState.validate()) {
      return;
    }
    var response = await LoginApi.login(login, senha);
    if (response) {
      Get.toNamed(Routes.HOME);
    } else {
      return showAlertDialog(context);
    }
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o usuário ";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }

  showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      color: Colors.green,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text('Dados Inválidos'),
      content: Text('Verifique se o usuário ou/e a senha estão corretos!'),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}


