import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/widgets/drawer_list.dart';

import 'carro.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: DrawerList(),
          appBar: AppBar(
            title: Text("Carros"),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Classicos'),
                Tab(text: 'Exportivos'),
                Tab(text: 'Luxo'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CarrosListView(),
              CarrosListView(),
              CarrosListView(),
            ],
          )),
    );
  }
}
