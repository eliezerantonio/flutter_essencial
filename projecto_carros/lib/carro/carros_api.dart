import 'package:projecto_carros/carro/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    String tipo = tipoCarro.toString().replaceAll("TipoCarro.", "");
    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';

    print("GET $url");
    var response = await http.get(url);
    String json = response.body;

    List list = convert.json.decode(json);
    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }
}
