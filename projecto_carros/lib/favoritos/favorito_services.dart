import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/favoritos/favorito.dart';
import 'package:projecto_carros/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro c) async {
    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    final exists = await dao.exists(c.id);

    if (exists) {
      dao.delete(c.id);
    } else {
      dao.save(f);
    }
  }

  static List<Carro> getCarros() {
    List<Carro> carros = [];
    return carros;
  }
}
