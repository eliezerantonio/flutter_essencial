import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/favoritos/base_dao.dart';

class CarroDAO extends BaseDAO<Carro> {
  @override
  String get tableName => "carro";

  @override
  Carro fromJson(Map<String, dynamic> map) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

 Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list =
        await dbClient.rawQuery('select * from carro where tipo =? ', [tipo]);

    return list.map<Carro>((json) => fromJson(json)).toList();
  }


}