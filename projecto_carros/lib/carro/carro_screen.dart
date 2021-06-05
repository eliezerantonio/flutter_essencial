import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/carro/loripsum_api.dart';
import 'package:projecto_carros/favoritos/favorito_services.dart';
import 'package:projecto_carros/helpers/text.dart';

class CarroScreen extends StatelessWidget {
  const CarroScreen(this.carro);
  final Carro carro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
            onSelected: _onClickPopupMenu,
          ),
        ],
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.network(carro.urlFoto),
          _bloco1(),
          Divider(),
          _bloco2()
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(carro.nome, fontSize: 20, bold: true),
            text(carro.tipo, fontSize: 16),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.red,
              iconSize: 40,
              onPressed: _onClickFavorito,
            ),
            IconButton(
              icon: Icon(Icons.share),
              iconSize: 40,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("editar");
        break;
      case "Deletar":
        print("Deletar");
        break;
      case "Share":
        print("Share");
        break;
    }
  }

  Widget _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(carro.descricao, bold: true),
        SizedBox(height: 10),
        FutureBuilder(
          future: LoripsumApu.getLoripsum(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return text(snapshot.data, fontSize: 16);
          },
        )
      ],
    );
  }

  void _onClickFavorito() {
    FavoritoService.favoritar(carro);
  }
}
