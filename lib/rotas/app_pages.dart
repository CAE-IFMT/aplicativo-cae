import 'package:controle_de_entrada/pages/home.dart';
import 'package:controle_de_entrada/pages/login.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => Login()),
    GetPage(name: Routes.HOME, page: () => Home()),
  ];
}
