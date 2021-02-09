import 'package:controle_de_entrada/widgets/qr_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class QRCodeResult extends GetView<QRCodeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        controller.result,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

}