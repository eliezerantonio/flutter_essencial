import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/favoritos/base_dao.dart';

class CarroDAO extends BaseDAO<Carro> {
  @override
  String get tableName => "carro";



}