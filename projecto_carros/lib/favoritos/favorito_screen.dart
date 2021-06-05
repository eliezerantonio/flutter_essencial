import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/favoritos/favoritos_bloc.dart';
import 'package:projecto_carros/widgets/text_error.dart';


class FavoritoScreen extends StatefulWidget {
 

  @override
  _FavoritoScreenState createState() => _FavoritoScreenState();
}

class _FavoritoScreenState extends State<FavoritoScreen>
    with AutomaticKeepAliveClientMixin<FavoritoScreen> {

  final _bloc = FavoritosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.fetch();
  }

  _fetch() async {
    _bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError(
            msg: "Impossivel buscar carros \n Clique aqui para tentar ",
            onPressed: _fetch,
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
