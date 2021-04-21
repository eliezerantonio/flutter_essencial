import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  const HelloListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ListView"),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      itemExtent: 300,
      children: [
        _img('1'),
        _img('2'),
        _img('3'),
        _img('4'),
        _img('5'),
      ],
    );
  }
}

_img(String imgNumber) {
  return Image.asset(
    "assets/images/dog$imgNumber.png",
    fit: BoxFit.cover,
  );
}
