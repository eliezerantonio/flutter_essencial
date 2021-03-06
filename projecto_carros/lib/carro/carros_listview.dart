import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projecto_carros/carro/carro_screen.dart';
import 'package:projecto_carros/carro/carros_model.dart';
import 'package:projecto_carros/helpers/nav.dart';
import 'package:projecto_carros/widgets/text_error.dart';
import 'package:share/share.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarrosListView extends StatelessWidget {
  CarrosListView(this.carros);
  List<Carro> carros;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
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
                  InkWell(
                    onLongPress: () => _onLongClickCarro(c, context),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: c.urlFoto ??
                            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png",
                        width: 250,
                      ),
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
                          onPressed: () => _onClickCarro(c, context),
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () => _onClickShare(c, context),
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

  _onClickCarro(Carro c, BuildContext context) {
    push(
      context,
      CarroScreen(c),
    );
  }

  _onLongClickCarro(Carro c, BuildContext context) {
    shoModalBottonSheet(context, builder(context)) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            c.nome,
            style: TextStyle(fontSize: 16),
          ),
          ListTile(
            title: Text("Detalhes"),
            leading: Icon(Icons.directions_car),
          ),
          ListTile(
            title: Text("Share"),
            onTap: () => _onClickShare(c, context),
            leading: Icon(Icons.share),
          ),
        ],
      );
    }
  }

  void _onClickShare(Carro c, BuildContext context) {
    print("Share ${c.nome}");

    Share.share(c.urlFoto); 
  }
}
