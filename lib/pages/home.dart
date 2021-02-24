import 'package:controle_de_entrada/conect_API/controllers/login_controller.dart';
import 'package:controle_de_entrada/conect_API/controllers/visita_controller.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:controle_de_entrada/widgets/body_cadastrados.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

            body: RefreshIndicator(
              onRefresh: _onRefresh,
              child:  ListaCadastrados(),
            )
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
              LoginController logincontroller = Get.find();
              logincontroller.flagEntrar = false;
              Get.toNamed(Routes.LOGIN);
            },
            child: Text('Sim'),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Future<void> _onRefresh() {
    VisitaController visitaController = Get.find();
    return visitaController.fetch();
  }
}
