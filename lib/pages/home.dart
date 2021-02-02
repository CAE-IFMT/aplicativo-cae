import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:controle_de_entrada/widgets/lista_cadastrados.dart';
import 'package:controle_de_entrada/widgets/qr_code_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<QRCodeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //tira o debug da telas
        theme: ThemeData(primarySwatch: Colors.green),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Controle de Acesso IFMT'),
              centerTitle: true,
              textTheme:
                  Theme.of(context).textTheme.apply(bodyColor: Colors.black),
            ),
            body: GetBuilder(
              init: controller,
              builder: (controller) {
                return controller.isOnScan ? _telaScan(context) : _telaLista();
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: Icon(Icons.qr_code_scanner),
              label: Text('Scan'),
              onPressed: () => controller.scanQR(),
            ),
          ),
        ),
      ),
    );
  }

  _telaScan(BuildContext context) {
    return Center(
      child: Text(
        controller.result,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  _telaLista() {
    return Container(
      child: ListaCadastrados(),
    );
  }

  Future<bool> _onBackPressed() {
    print('entrou nmo bagui');
    return showDialog(
      context: Get.context,
      builder: (context) => new AlertDialog(
        title: Text('Deseja Sair?'),
        content: Text('Você será direcionado para a tela de login!'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Não'),
            color: Colors.green,
          ),
          FlatButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            child: Text('Sim'),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
