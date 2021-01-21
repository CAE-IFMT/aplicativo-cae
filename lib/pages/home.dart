import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
          //body: TabBarView(
          //children: <Widget>[
          //],
          //),
        ),
        // body: Text("Olá flutter!!!"),
      ),
    );
  }
}