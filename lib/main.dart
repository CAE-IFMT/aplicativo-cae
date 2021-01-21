import 'package:controle_de_entrada/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira o debug da telas
      home: Login(),
    );
  }

}

