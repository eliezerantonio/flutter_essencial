import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/favoritos/favorito.dart';
import 'package:projecto_carros/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro c) {
    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();
  }
}
