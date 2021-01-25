// import 'package:controle_de_entrada/conect_API/model/pessoa.dart';
//
// class PessoaResponse {
//   PessoaModel data;
//   int queueSize;
//   String message;
//   bool hasError;
//
//   PessoaResponse(
//       {PessoaModel data, int queueSize, String message, bool hasError}) {
//     this.data = data;
//     this.queueSize = queueSize;
//     this.message = message;
//     this.hasError = hasError;
//   }
//
//   PessoaResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new PessoaModel.fromJson(json['data']) : null;
//     queueSize = json['queueSize'];
//     message = json['message'];
//     hasError = json['hasError'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     data['queueSize'] = this.queueSize;
//     data['message'] = this.message;
//     data['hasError'] = this.hasError;
//     return data;
//   }
//
//   @override
//   String toString() {
//     return 'SensorResponse{data: $data, queueSize: $queueSize, message: $message, hasError: $hasError}';
//   }
// }