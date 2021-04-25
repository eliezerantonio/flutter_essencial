import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carros_api.dart';
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
      body: _body(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      c.urlFoto,
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Descricao..",
                    style: TextStyle(fontSize: 17),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Text("DETALHES"),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text("SHARE"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
