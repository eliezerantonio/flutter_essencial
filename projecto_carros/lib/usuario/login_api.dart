import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/usuario/usuario.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {
        'username': login,
        'password': senha,
      };

      String s = json.encode(params);
      var response = await http.post(url, body: s, headers: headers);

      Map mapResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final user = Usuario.fromJSON(mapResponse);
        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      return ApiResponse.error("Impossivel fazer login");
    }
  }
}
