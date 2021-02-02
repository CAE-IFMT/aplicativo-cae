import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi{
  static Future<bool> login(String user, String password) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login'; //alterar url

    var header = {"Content-Type" : "application/json"};

    Map params = {
      "login": user,
      "senha": password
    };
    var _bory = json.encode(params);

    print('js0on ${_bory}');

    var response = await http.post(url, headers: header, body: _bory);


    print('Status ${response.statusCode}');
    print('Bory  ${response.body}');

    //if(response.statusCode == 200){
      return true;
    // }
    // else{
    //   return false;
    // }

  }
}