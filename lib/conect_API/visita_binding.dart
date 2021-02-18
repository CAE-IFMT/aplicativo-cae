import 'package:controle_de_entrada/conect_API/controllers/scan_controller.dart';
import 'package:controle_de_entrada/conect_API/controllers/visita_controller.dart';
import 'package:controle_de_entrada/conect_API/provider/visita_provedor.dart';
import 'package:controle_de_entrada/conect_API/repository/visita_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class VisitaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitaController>(
          () =>
          VisitaController(
            repository: VisitaRepository(
              provider: VisitaProvider(
                dio: Dio(),
              ),
            ),
          ),
    );
    Get.lazyPut<ScanController>(
            () =>
            ScanController(
                repository: VisitaRepository(
                    provider: VisitaProvider(
                      dio: Dio(),
                    )
                )
            )
    );
  }
}