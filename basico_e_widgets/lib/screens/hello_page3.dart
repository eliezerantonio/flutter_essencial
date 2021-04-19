import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  const HelloPage3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello page 3"),
      ),
      body: _body(context, "Voltar"),
    );
  }

  _body(BuildContext context, String text) {
    return Center(
      child:RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed:()=> _onClickVoltar,
      child: Text(text),
    ),
    );
  }

  void _onClickVoltar(BuildContext context) => Navigator.pop(context, "Tela 3");
}
