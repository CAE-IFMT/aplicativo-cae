import 'package:barcode_scan/barcode_scan.dart';
import 'package:controle_de_entrada/conect_API/model/visita.dart';
import 'package:controle_de_entrada/conect_API/repository/visita_repository.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VisitaController extends GetxController {
  VisitaRepository repository;
  VisitaController({@required this.repository});

  List<VisitaModel> _visitas;
  List<VisitaModel> get visitas => this._visitas;

   List<VisitaModel> _listOcorridos;
   List<VisitaModel> get listOcorridos => this._listOcorridos;

   List<VisitaModel> _listNaoOcorridos;
   List<VisitaModel> get listNaoOcorridos => this._listNaoOcorridos;

  bool _isOnScan = false;
  bool get isOnScan => _isOnScan;
  set isOnScan(bool value) {
    _isOnScan = value;
    update();
  }

  String _result;
  String get result => _result;

  Future<void> fetch() async {
    this._listOcorridos = await this.repository.listaOcorridos();
    this._listNaoOcorridos = await this.repository.listaNaoOcorridos();
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
    } finally{
      update();
    }
  }


}
