import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';

class CarroScreen extends StatelessWidget {
  const CarroScreen({Key key, this.carro}) : super(key: key);
  final Carro carro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.network(carro.urlFoto),
    );
  }
}
