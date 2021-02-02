import 'package:barcode_scan/barcode_scan.dart';
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
        result = 'Camera permission was denied';
      } else {
        result = 'Unknown Error $ex';
      }
    } on FormatException {
      result = 'You pressed the back button before scanning anything';
    } catch (ex) {
      result = 'Unknown Error $ex';
    } finally {
      update();
    }
  }
}
