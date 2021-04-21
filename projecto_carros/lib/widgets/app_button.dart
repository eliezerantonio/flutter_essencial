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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
