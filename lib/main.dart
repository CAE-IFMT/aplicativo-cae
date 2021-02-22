import 'package:controle_de_entrada/conect_API/visita_binding.dart';
import 'package:controle_de_entrada/rotas/app_pages.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      initialBinding: VisitaListBinding(),
      getPages: AppPages.routes,
      initialRoute: Routes.LOGIN,
    );
  }
}
