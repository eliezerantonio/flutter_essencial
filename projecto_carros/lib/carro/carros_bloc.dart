import 'dart:async';

import 'package:projecto_carros/carro/carros_api.dart';

import 'carro.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  fetch(TipoCarro tipoCarro) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipoCarro);

      _streamController.add(carros);
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
