import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/carro/carro_dao.dart';
import 'package:projecto_carros/favoritos/favorito.dart';
import 'package:projecto_carros/favoritos/favorito_dao.dart';
import 'package:projecto_carros/favoritos/favoritos_bloc.dart';
import 'package:projecto_carros/favoritos/favoritos_model.dart';
import 'package:provider/provider.dart';

class FavoritoService {
  static Future<bool> favoritar(Carro c, BuildContext context) async {
    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    final exists = await dao.exists(c.id);

    if (exists) {
      dao.delete(c.id);

      Provider.of<FavoritosModel>(context, listen: false).getCarros();
      return false;
    } else {
      dao.save(f);

      Provider.of<FavoritosModel>(context, listen: false).getCarros();
      return true;
    }
  }

  static Future<List<Carro>> getCarros() async {
    List<Carro> carros = await CarrosDAO()
        .query("SELECT * FROM carro c, favorito f  where c.id=f.id");

    print(carros);
    return carros;
  }

  static Future<bool> isFavorite(Carro c) async {
    final dao = FavoritoDAO();

    final exist = await dao.exists(c.id);
  }
}
