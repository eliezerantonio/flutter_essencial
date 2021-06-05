import 'package:projecto_carros/carro/carro.dart';
import 'package:http/http.dart' as http;
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
}
