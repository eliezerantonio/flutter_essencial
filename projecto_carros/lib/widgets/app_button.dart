import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key key, this.onPressed, this.text}) : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
