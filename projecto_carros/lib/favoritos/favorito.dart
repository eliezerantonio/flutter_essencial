import 'package:projecto_carros/favoritos/entity.dart';

class Favorito extends Entity {
  int id;
  String nome;

  Favorito.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    nome=map["nome"];
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
