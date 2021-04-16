import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello flutter"),
      ),
      body: Container(
        child: Column(
          children: [
            _text(),
            _img(),
            _button(),
          ],
        ),
      ),
    );
  }

  Text _text() {
    return Text(
      "Hello Word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }

  _img() {
    return Image.asset(
      "assets/images/dog1.png",
      fit: BoxFit.cover,
    );
  }

  _button() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: _onClickOk,
      child: Text("ok"),
    );
  }

  void _onClickOk() {
    print("Clicou no botao");
  }
}
