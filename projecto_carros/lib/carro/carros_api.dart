import 'dart:io';

import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/carro/carro_dao.dart';
import 'dart:convert' as convert;
import 'package:projecto_carros/helpers/http_helper.dart' as http;

import 'package:projecto_carros/usuario/usuario.dart';

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    ;

    String tipo = tipoCarro.toString().replaceAll("TipoCarro.", "");
    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

    print("GET $url");
    var response = await http.get(
      url,
    );
    String json = response.body;

    List list = convert.json.decode(json);
    List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();
    final dao = CarrosDAO();
//salvar todos carros
    carros.forEach(dao.save);
    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro c, File file) async {
    if (file != null) {
      
    }
    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
    if (c.id != null) {
      url += "/${c.id}";
    }

    print("POST > $url");

    String json = c.toJsonC();

    var response = await (c.id == null
        ? http.post(
            url,
            body: json,
          )
        : http.put(
            url,
            body: json,
          ));

    print("reponse status: ${response.statusCode} ");
    print("response body: ${response.body}");

    if (response.statusCode == 201 || response.statusCode == 200) {
      Map mapResponse = convert.json.decode(response.body);

      Carro carro = Carro.fromJson(mapResponse);

      print("Novo carro ${carro.id}");

      return ApiResponse.ok(true);
    }
    if (response.body == null || response.body.isEmpty) {
      return ApiResponse.error("Nao foi possivel salvar o carro");
    }
    Map mapResponse = convert.json.decode(response.body);
    return ApiResponse.error(mapResponse["error"]);
  }

  static Future<ApiResponse<bool>> delete(Carro c) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/${c.id}';

    print("POST > $url");

    var response = await http.delete(
      url,
    );

    print("reponse status: ${response.statusCode}");
    print("response body: ${response.body}");

    if (response.statusCode == 201 || response.statusCode == 200) {
      return ApiResponse.ok(true);
    }

    return ApiResponse.error("Nao foi possivel apagar o carro");
  }
}
