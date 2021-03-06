import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../routes/routes.dart';
import '../widgets/widgets.dart';

///classe que cria a tela de Login
class Login extends GetView<LoginController> {
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
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        body: GetBuilder(
          init: controller,
          builder: (controller) {
            return _body(controller, context);
          },
        ),
      ),
    );
  }

  ///metodo que define a estrutura adicionando os widgets
  Form _body(LoginController controller, BuildContext context) {
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
              controller: controller.usuario,
              validator: _validateLogin,
            ),
            SizedBox(height: 10),
            AppText(
              'Senha',
              'Informe a Senha',
              password: true,
              controller: controller.senha,
              validator: _validateSenha,
            ),
            SizedBox(height: 10),
            AppButton(
              'Entrar',
              onPressed: () => _onClickLogin(controller, context),
              showProgress: controller.flagEntrar,
            ),
          ],
        ),
      ),
    );
  }

  ///metodo que controla o botão "Entrar" da tela
  _onClickLogin(LoginController controller, BuildContext context) async {
    String login = controller.usuario.text;
    String senha = controller.senha.text;

    if (!_formKey.currentState.validate()) {
      return;
    }

    controller.flagEntrar = true;

    var response = await controller.login(login, senha);
    if (response) {
      controller.flagEntrar = true;
      Get.toNamed(Routes.HOME);
    } else {
      return showAlertDialog(context);
    }
  }

  ///metodo que verifica se o login está nulo
  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o usuário ";
    }
    return null;
  }

  ///metodo que verifica se a senha está nula
  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }
    return null;
  }

  ///metodo que mostra mensagem na tela caso login/senha estejam errados
  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dados Inválidos'),
          content: Text('Verifique se o usuário ou/e a senha estão corretos!'),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
              child: Text("OK"),
              color: Colors.green,
              onPressed: () {
                controller.flagEntrar = false;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
