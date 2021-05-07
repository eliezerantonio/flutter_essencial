import 'package:projecto_carros/carro/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';
    var response = await http.get(url);
    String json = response.body;

    List list = convert.json.decode(json);
    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }
}
