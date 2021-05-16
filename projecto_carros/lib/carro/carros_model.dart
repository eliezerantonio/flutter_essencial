import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/simple_bloc.dart';

import 'carro.dart';

part 'carros_model.g.dart';

class CarrosModel = CarrosModelBase with _$CarrosModel;

abstract class CarrosModelBase with Store {
  @observable
  List<Carro> carros;

  @observable
  Exception error;

  @action //nos metodos que vao alterar a interface
  fetch(TipoCarro tipoCarro) async {
    try {
      error = null;
      this.carros = await CarrosApi.getCarros(tipoCarro);
    } catch (e) {
      error = e;
    }
  }
}
