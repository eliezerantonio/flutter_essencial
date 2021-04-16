import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello flutter"),
      ),
      body: SingleChildScrollView(
        child: _container(),
      ),
    );
  }

  _container() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _text(),
          _pageView(),
          _buttons(),
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 40),
      height: 300,
      child: PageView(
        children: [
          _img("1"),
          _img("2"),
          _img("3"),
          _img("4"),
          _img("5"),
        ],
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

  _img(String imgNumber) {
    return Image.asset(
      "assets/images/dog$imgNumber.png",
      fit: BoxFit.cover,
    );
  }

  _button(String text) {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: _onClickOk,
      child: Text(text),
    );
  }

  void _onClickOk() {
    print("Clicou no botao");
  }

  _buttons() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button("ListView"),
          _button("Page 2"),
          _button("Page 3"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button("Snack"),
          _button("Dialog"),
          _button("Toast"),
        ],
      )
    ]);
  }
}
