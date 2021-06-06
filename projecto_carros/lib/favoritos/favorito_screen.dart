import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/favoritos/favoritos_bloc.dart';
import 'package:projecto_carros/favoritos/favoritos_model.dart';
import 'package:projecto_carros/widgets/text_error.dart';
import 'package:provider/provider.dart';

class FavoritoScreen extends StatefulWidget {
  @override
  _FavoritoScreenState createState() => _FavoritoScreenState();
}

class _FavoritoScreenState extends State<FavoritoScreen>
    with AutomaticKeepAliveClientMixin<FavoritoScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final _bloc = Provider.of<FavoritosModel>(context, listen: false);
    _bloc.getCarros();
  }

  _fetch() async {
    final _bloc = Provider.of<FavoritosModel>(context, listen: false);
    _bloc.getCarros();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final model = Provider.of<FavoritosModel>(context);

    List<Carro> carros = model.carros;

    if (carros.isEmpty) {
      return Center(
        child: Text("Nenhu, carros nos favoritos"),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CarrosListView(carros),
    );
  }

  Future<void> _onRefresh() {
    final _bloc = Provider.of<FavoritosModel>(context, listen: false);
    return _bloc.getCarros();
  }
}
