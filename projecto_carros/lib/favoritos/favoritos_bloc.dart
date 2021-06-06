import 'dart:async';

import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/favoritos/favorito_services.dart';


class FavoritosBloc {
  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  Future<List<Carro>> fetch() async {
    try {
      List<Carro> carros = await FavoritoService.getCarros();

      _streamController.add(carros);
      return carros;
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
