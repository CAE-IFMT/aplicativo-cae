import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class ScanQRCode extends StatefulWidget {
  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}
class _ScanQRCodeState extends State<ScanQRCode> {
  String result = 'Hey There!';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text('Scan'),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  
  Future _scanQR() async{
    try{
      String qrResult = (await BarcodeScanner.scan()) as String;
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex){
      if(ex.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
          result = 'Camera permission was denied';
        });
      }else{
        setState(() {
          result = 'Unknown Error $ex';
        });
      }
    } on FormatException{
      setState(() {
        result = 'You pressed the back button before scanning anything';
      });
    } catch(ex){
      setState(() {
        result = 'Unknown Error $ex';
      });
    }
  }
}

class Result extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

  }

}