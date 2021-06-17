import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projecto_carros/carro/carro.dart';

class MapaScreen extends StatelessWidget {
  final Carro carro;
  const MapaScreen({Key key, this.carro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: latLng(), zoom: 17),
      ),
    );
  }

  latLng() {
    return carro.latLng();
  }
}
