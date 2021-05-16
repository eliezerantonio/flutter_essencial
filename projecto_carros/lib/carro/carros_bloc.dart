import 'dart:async';

import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/simple_bloc.dart';

import 'carro.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  fetch(TipoCarro tipoCarro) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipoCarro);

      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}
