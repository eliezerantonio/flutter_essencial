import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carros_bloc.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/carro/carros_bloc.dart';
import 'package:projecto_carros/helpers/event_bus.dart';
import 'package:projecto_carros/widgets/text_error.dart';
import 'package:provider/provider.dart';

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
  TipoCarro get tipo => widget.tipoCarro;

  StreamSubscription<String> subscription;

  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.fetch(tipo);

    final bus = Provider.of<EventBus>(context, listen: false);
    subscription = bus.stream.listen((event) {});
  }

  _fetch() async {
    _bloc.fetch(tipo);
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
    return _bloc.fetch(tipo);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    subscription.cancel();
  }
}
