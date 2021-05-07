import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/widgets/drawer_list.dart';

import 'carro.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerList(),
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: CarrosListView(),
    );
  }
}
