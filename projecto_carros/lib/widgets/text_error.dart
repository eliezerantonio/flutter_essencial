import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  const TextError({Key key, this.msg, this.onPressed}) : super(key: key);

  final String msg;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: onPressed,
      child: Text(
        msg,
        style: TextStyle(color: Colors.red, fontSize: 22),
      ),
    ));
  }
}
