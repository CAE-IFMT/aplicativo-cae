import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../routes/routes.dart';
import '../widgets/body_cadastrados.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Controle de Acesso IFMT'),
              centerTitle: true,
              textTheme:
                  Theme.of(context).textTheme.apply(bodyColor: Colors.white),
            ),
            body: ListaCadastrados(),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: Get.context,
      builder: (context) => new AlertDialog(
        title: Text('Deseja Sair?'),
        content: Text('Você será direcionado para a tela de login'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Não'),
            color: Colors.green,
          ),
          FlatButton(
            onPressed: () {
              var loginController = Get.find<LoginController>();
              loginController.flagEntrar = false;
              Get.toNamed(Routes.LOGIN);
            },
            child: Text('Sim'),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
