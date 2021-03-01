import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../modules/routes/routes.dart';

class VisitaController extends GetxController {
  VisitaRepository repository;

  VisitaController({@required this.repository});

  List<Visita> _visitas;

  List<Visita> get visitas => this._visitas;

  List<Visita> _listOcorridos;

  List<Visita> get listOcorridos => this._listOcorridos;

  List<Visita> _listNaoOcorridos;

  List<Visita> get listNaoOcorridos => this._listNaoOcorridos;

  bool _isOnScan = false;

  bool get isOnScan => _isOnScan;

  set isOnScan(bool value) {
    _isOnScan = value;
    update();
  }

  String _result;

  String get result => _result;

  Future<void> fetch(String flag) async {
    if (flag == 'ocorridos') {
      this._listOcorridos = await this.repository.listaOcorridos();
    } else if (flag == 'naoOcorridos') {
      this._listNaoOcorridos = await this.repository.listaNaoOcorridos();
    }
    update();
  }

  Future scanQR() async {
    try {
      _result = (await BarcodeScanner.scan());
      _isOnScan = true;
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        _result = 'A permissão da câmera foi negada!';
        _isOnScan = false;
      } else {
        _result = 'Erro desconhecido $ex';
        _isOnScan = false;
      }
    } on FormatException {
      Get.toNamed(Routes.HOME);
      _isOnScan = false;
    } catch (ex) {
      _result = 'Erro desconhecido $ex';
      _isOnScan = false;
    } finally {
      update();
    }
  }
}
