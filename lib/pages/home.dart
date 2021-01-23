import 'package:controle_de_entrada/widgets/scan_qrcode.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Theme.of(context).textTheme.apply(bodyColor: Colors.black),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.qr_code_scanner)),
              ],
            ),
          ),
          body: TabBarView(
            children: containers,
          ),
        ),
      ),
    );
  }

  List<Widget> containers = [
    Container(
      color: Colors.blue,
    ),
    Container(
      child: ScanQRCode(),
    ),
  ];
}
