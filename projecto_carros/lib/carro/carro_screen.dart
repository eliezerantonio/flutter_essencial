import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/carro/carros_api.dart';
import 'package:projecto_carros/carro/loripsum_api.dart';
import 'package:projecto_carros/favoritos/favorito_services.dart';
import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/helpers/event_bus.dart';
import 'package:projecto_carros/helpers/nav.dart';
import 'package:projecto_carros/helpers/scaffold_messenger.dart';
import 'package:projecto_carros/helpers/text.dart';

import 'carro_form_page.dart';

class CarroScreen extends StatefulWidget {
  const CarroScreen(this.carro);
  final Carro carro;

  @override
  _CarroScreenState createState() => _CarroScreenState();
}

class _CarroScreenState extends State<CarroScreen> {
  Color color = Colors.grey;

  @override
  void initState() {
    super.initState();

    FavoritoService.isFavorite(widget.carro).then((favorito) {
      setState(() {
        color = favorito ? Colors.red : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
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
          Image.network(widget.carro.urlFoto ??
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Impala_Coupe.png"),
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
            text(widget.carro.nome, fontSize: 20, bold: true),
            text(widget.carro.tipo, fontSize: 16),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              color: color,
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
        push(context, CarroFormPage(carro: widget.carro));
        break;
      case "Deletar":
        deletar();
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
        text(widget.carro.descricao, bold: true),
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

  void _onClickFavorito() async {
    bool favorito = await FavoritoService.favoritar(widget.carro, context);

    setState(() {
      color = favorito ? Colors.red : Colors.grey;
    });
  }

  void deletar() async {
    ApiResponse<bool> response = await CarrosApi.delete(widget.carro);
    if (response.ok) {
      messenger(context, "Carro deletado com sucesso");
      EventBus.get(context).sendEvent(CarroEvent(
        "carro salvo",
        widget.carro.tipo,
      ));
    } else {
      messenger(context, response.msg);
    }
  }

  void _onClickVideo(context) {
    if (widget.carro.urlVideo != widget.carro.urlVideo.isNotEmpty) {
    } else {
      messenger(context, "Erro Este carro nao tem video!");
    }
  }
}
