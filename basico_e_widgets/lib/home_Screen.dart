import 'package:basico_e_widgets/screens/hello_page1.dart';
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
        child: _container(context),
      ),
    );
  }

  _container(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _text(),
          _pageView(),
          _buttons(context),
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

  _button(BuildContext context, String text) {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () => _onClickOk(context),
      child: Text(text),
    );
  }

  void _onClickOk(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HelloPage1(),
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button(context, "ListView"),
          _button(context, "Page 2"),
          _button(context, "Page 3"),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button(context, "Snack"),
          _button(context, "Dialog"),
          _button(context, "Toast"),
        ],
      )
    ]);
  }
}
