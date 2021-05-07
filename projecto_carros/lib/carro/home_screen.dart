import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/carros_listview.dart';
import 'package:projecto_carros/helpers/prefs.dart';
import 'package:projecto_carros/widgets/drawer_list.dart';

import 'carro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin<HomeScreen> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  _initTabs() async {
    // Primeiro busca o índice nas prefs.
    int tabIdx = await Prefs.getInt("tabIdx");

    // Depois cria o TabController
    // No método build na primeira vez ele poderá estar nulo
    _tabController = TabController(length: 3, vsync: this);

    // Agora que temos o TabController e o índice da tab,
    // chama o setState para redesenhar a tela
    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerList(),
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Classicos'),
              Tab(text: 'Exportivos'),
              Tab(text: 'Luxo'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CarrosListView(TipoCarro.classicos),
            CarrosListView(TipoCarro.esportivos),
            CarrosListView(TipoCarro.luxo),
          ],
        ));
  }
}
