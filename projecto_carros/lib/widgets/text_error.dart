import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  const TextError({Key key, this.msg}) : super(key: key);

final  String msg;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      msg,
      style: TextStyle(color: Colors.red, fontSize: 22),
    ));
  }
}
