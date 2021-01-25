import 'package:controle_de_entrada/widgets/lista_cadastrados.dart';
import 'package:controle_de_entrada/widgets/qr_code_controller.dart';
import 'package:controle_de_entrada/widgets/scan_qrcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<QRCodeController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira o debug da telas
      theme: ThemeData(primarySwatch: Colors.green),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Controle de Acesso IFMT'),
            centerTitle: true,
            textTheme:
            Theme
                .of(context)
                .textTheme
                .apply(bodyColor: Colors.black),
            // bottom: TabBar(
            //   tabs: <Widget>[
            //     Tab(icon: Icon(Icons.list)),
            //     Tab(icon: Icon(Icons.qr_code_scanner)),
            //   ],
            // ),
          ),
          // body: TabBarView(
          //   children: containers,
          // ),
          body: GetBuilder(
            init: controller,
            builder: (controller) {
              return controller.isOnScan ? Center(
                child: Text(
                  controller.result,
                  style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ) :
              Container(
                child: ListaCadastrados(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.qr_code_scanner),
            label: Text('Scan'),
            onPressed: () => controller.scanQR(),
          ),
        ),
      ),
    );
  }




// List<Widget> containers = [
//   Container(
//     child: ListaCadastrados(),
//   ),
//   Container(
//    child: ScanQRCode(),
//   ),
// ];
}
