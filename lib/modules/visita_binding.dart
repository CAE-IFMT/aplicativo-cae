import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../domain/providers/providers.dart';
import '../domain/repositories/repositories.dart';
import 'controllers/controllers.dart';


/// Classe responsavel pela injeção de dependencias de todo o projeto
class VisitaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitaController>(
      () => VisitaController(
        repository: VisitaRepository(
          provider: VisitaProvider(
            dio: Dio(),
          ),
        ),
      ),
    );
    Get.lazyPut<ScanController>(
      () => ScanController(
        repository: VisitaRepository(
          provider: VisitaProvider(
            dio: Dio(),
          ),
        ),
      ),
    );
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
