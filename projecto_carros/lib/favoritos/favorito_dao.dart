import '../helpers/sql/base_dao.dart';
import 'favorito.dart';

class FavoritoDAO extends BaseDAO<Favorito> {
  @override
  fromJson(Map<String, dynamic> map) {
    return Favorito.fromJson(map);
  }

  @override
  String get tableName => "favorito";
}
