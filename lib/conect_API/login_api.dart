import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi{
  static Future<bool> login(String user, String password) async {
    //var url = 'https://carros-springboot.herokuapp.com/api/v2/login'; //alterar url
    //var url = 'http://192.168.0.106:8080/visita';

    // var header = {"Content-Type" : "application/json"};
    //
    // Map params = {
    //   "login": user,
    //   "senha": password
    // };
    // var _body = json.encode(params);
    //
    // print('json $_body');
    //
    // var response = await http.get(url, headers: header);
    //
    //
    // print('Status ${response.statusCode}');
    // print('Bory  ${response.body}');

    //if(response.statusCode == 200){
      return true;
     //}
    //else{
      // return false;
     //}

  }
}