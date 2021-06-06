import 'package:projecto_carros/carro/carro.dart';
import 'package:http/http.dart' as http;
import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/helpers/sql/base_dao.dart';
import 'package:projecto_carros/carro/carro_dao.dart';
import 'dart:convert' as convert;

import 'package:projecto_carros/usuario/usuario.dart';

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    Usuario user = await Usuario.get();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${user.token}",
    };

    String tipo = tipoCarro.toString().replaceAll("TipoCarro.", "");
    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

    print("GET $url");
    var response = await http.get(url, headers: headers);
    String json = response.body;

    List list = convert.json.decode(json);
    List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();
    final dao = CarrosDAO();
//salvar todos carros
    carros.forEach(dao.save);
    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro c) async {
    Usuario user = await Usuario.get();
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${user.toJson}"
    };

    var url = "https://carros-springboot.herokuapp.com/api/v2/carros";

    print("POST > $url");

    String json = c.toJsonC();

    var response = await http.post(url, body: json, headers: headers);

    print("reponse status: ${response.statusCode} ");
    print("response body: ${response.body}");

    if (response.statusCode == 201) {
      Map mapResponse = convert.json.decode(response.body);

      Carro carro = Carro.fromJson(mapResponse);

      print("Novo carro ${carro.id}");

      return ApiResponse.ok(true);
    }

    Map mapResponse = convert.json.decode(response.body);
    return ApiResponse.error(mapResponse["error"]);
  }
}
