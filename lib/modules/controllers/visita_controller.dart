import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/repositories.dart';
import '../../modules/routes/routes.dart';

///classe que controla as informações de todas as visitas
class VisitaController extends GetxController {
  ///recebe dados do repositório de Visita
  VisitaRepository repository;

  ///Construtor da classe
  VisitaController({@required this.repository});

  ///recebe dados de todas as visitas
  List<Visita> _visitas;
  List<Visita> get visitas => this._visitas;

  ///lista de visitas ja ocorridas
  List<Visita> _listOcorridos;
  List<Visita> get listOcorridos => this._listOcorridos;

  ///lista de visitas não ocorridas
  List<Visita> _listNaoOcorridos;
  List<Visita> get listNaoOcorridos => this._listNaoOcorridos;

  ///flag de controle para a tela de Scan
  bool _isOnScan = false;
  bool get isOnScan => _isOnScan;
  set isOnScan(bool value) {
    _isOnScan = value;
    update();
  }

  ///String recebida através do QRCode
  String _result;
  String get result => _result;

  ///busca no repositório as listas de visitas ocorridas e não ocorridas
  Future<void> fetch() async {
    this._listOcorridos = await this.repository.listaOcorridos();
    this._listNaoOcorridos = await this.repository.listaNaoOcorridos();
    update();
  }

  ///método que executa o Scan do QRCode e devolve o msm ou lança alguma
  ///excessão caso ocorra erro
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
