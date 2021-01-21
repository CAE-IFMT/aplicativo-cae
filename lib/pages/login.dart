import 'package:controle_de_entrada/widgets/button.dart';
import 'package:controle_de_entrada/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _login = TextEditingController();
  final _senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira o debug da telas
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Controle de Acesso IFMT'),
          centerTitle: true,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
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
            AppText('Login', 'Informe o Login',
                controller: _login, validator: _validateLogin),
            SizedBox(height: 10),
            AppText('Senha', 'Informe a Senha',
                password: true, controller: _senha, validator: _validateSenha),
            SizedBox(height: 10),
            AppButton(
              'Login',
              onPressed: _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() {
    String login = _login.text;
    String senha = _senha.text;
    if (!_formKey.currentState.validate()) {
      return;
    }
    //fazer validaçao de dados com a api
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    //print('Login: $login, Senha: $senha');
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }
}
