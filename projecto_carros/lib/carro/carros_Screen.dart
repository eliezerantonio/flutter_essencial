import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projecto_carros/carro/carro_screen.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/carro/carros_model.dart';
import 'package:projecto_carros/helpers/nav.dart';
import 'package:projecto_carros/widgets/text_error.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarroPage extends StatefulWidget {
  CarroPage(this.tipoCarro);
  TipoCarro tipoCarro;

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage>
    with AutomaticKeepAliveClientMixin<CarroPage> {
  List<Carro> carros;

  TipoCarro get tipo => widget.tipoCarro;

  final _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _model.fetch(tipo);
  }

  _fetch() {
    _model.fetch(tipo);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Carro> carros = _model.carros;
        if (_model.error != null) {
          return TextError(
            msg: "Impossivel buscar carros \n Clique aqui para tentar ",
            onPressed: _fetch,
          );
        }
        if (carros == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return CarrosListView(carros);
      },
    );
  }


}
