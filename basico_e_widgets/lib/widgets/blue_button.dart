import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(this.text,
      {@required this.onPressed, this.color = Colors.blue});
  final String text;
  final Function onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
