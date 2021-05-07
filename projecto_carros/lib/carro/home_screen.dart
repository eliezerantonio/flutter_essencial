import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/widgets/drawer_list.dart';

import 'carro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin<HomeScreen> {
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
              CarrosListView(TipoCarro.classicos),
              CarrosListView(TipoCarro.esportivos),
              CarrosListView(TipoCarro.luxo),
            ],
          )),
    );
  }
}
