import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro_screen.dart';
import 'package:projecto_carros/helpers/nav.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarrosListView extends StatefulWidget {
  CarrosListView(this.tipoCarro);
  TipoCarro tipoCarro;

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    Future<List<Carro>> carros = CarrosApi.getCarros(widget.tipoCarro);
    return FutureBuilder(
      future: carros,
      builder: (context, snapshot) {
        List<Carro> carros = snapshot.data;
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Impossivel buscar carros",
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return _listView(carros);
      },
    );
  }

  Padding _listView(List<Carro> carros) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
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
                      c.urlFoto ??
                          "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png",
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
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickCarro(c),
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(Carro c) {
    push(
      context,
      CarroScreen(
        carro: c,
      ),
    );
  }
}
