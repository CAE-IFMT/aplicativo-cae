import 'package:controle_de_entrada/conect_API/pessoa_bindings.dart';
import 'package:controle_de_entrada/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false, //tira o debug da telas
      initialBinding: PessoaListBinding(),
      home: Login(),
    );
  }

}

