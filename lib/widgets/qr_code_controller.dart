import 'package:barcode_scan/barcode_scan.dart';
import 'package:controle_de_entrada/rotas/rotas.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class QRCodeController extends GetxController {
  String result = 'Hey There!';
  bool _isOnScan = false;

  bool get isOnScan => _isOnScan;

   Future scanQR() async {
    _isOnScan = true;
    try {
      String qrResult = (await BarcodeScanner.scan());
      result = qrResult;
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        result = 'A permissão da câmera foi negada!';
      } else {
        result = 'Erro desconhecido $ex';
      }
    } on FormatException {
      _isOnScan = false;
       Get.toNamed(Routes.HOME);
    } catch (ex) {
      result = 'Erro desconhecido $ex';
    } finally {
      update();
    }
  }
}
