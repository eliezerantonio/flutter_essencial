import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {"Content-type": "application/json"};

    Map params = {
      'username': login,
      'password': senha,
    };

    String s = json.encode(params);
    var response = await http.post(url, body: s, headers: headers);

    print(response.statusCode);
    print(response.body);

    Map mapResponse = json.decode(response.body);
    String nome = mapResponse["nome"];
    String email = mapResponse["email"];

    print("$nome");
    print("$email");
    return true;
  }
}
