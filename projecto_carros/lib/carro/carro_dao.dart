import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/helpers/sql/base_dao.dart';

class CarrosDAO extends BaseDAO<Carro> {
  @override
  String get tableName => "carro";

  @override
  Carro fromJson(Map<String, dynamic> map) {
    return Carro.fromJson(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo)  {
    return query('select * from carro where tipo =? ', [tipo]);
  }
}
