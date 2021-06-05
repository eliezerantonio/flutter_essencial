import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/helpers/sql/entity.dart';

class Favorito extends Entity {
  int id;
  String nome;

  Favorito.fromCarro(Carro c) {
    this.id = c.id;
    this.nome = c.nome;
  }
  
  Favorito.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    nome = map["nome"];
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
