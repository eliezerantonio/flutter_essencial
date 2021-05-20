import 'package:flutter/material.dart';
import 'package:projecto_carros/carro/carro.dart';
import 'package:projecto_carros/helpers/text.dart';

class CarroScreen extends StatelessWidget {
  const CarroScreen({Key key, this.carro}) : super(key: key);
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
              onPressed: () {},
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
        SizedBox(
          height: 10,
        ),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Comprehensum, quod cognitum non habet? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quae tamen a te agetur non melior, quam illae sunt, quas interdum optines. Suam denique cuique naturam esse ad vivendum ducem.")
      ],
    );
  }
}
