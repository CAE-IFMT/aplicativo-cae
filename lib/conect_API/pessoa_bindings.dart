import 'package:controle_de_entrada/conect_API/controllers/PessoaController.dart';
import 'package:controle_de_entrada/conect_API/provider/pessoa_provedor.dart';
import 'package:controle_de_entrada/conect_API/repository/pessoa_repository.dart';
import 'package:controle_de_entrada/widgets/qr_code_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PessoaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PessoaController>(
          () => PessoaController(
        repository: PessoaRepository(
          provider: PessoaProvider(
            dio: Dio(),
          ),
        ),
      ),
    );
    Get.lazyPut<QRCodeController>(() => QRCodeController());
  }
}