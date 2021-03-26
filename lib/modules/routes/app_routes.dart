import 'package:controle_de_entrada/modules/pages/home.dart';
import 'package:controle_de_entrada/modules/pages/login.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

///classe que define as rotas de tela
abstract class Routes {
  static const LOGIN = '/login';
  static const HOME = '/home';
}

class AppPages {
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => Login()),
    GetPage(name: Routes.HOME, page: () => Home()),
  ];
}
