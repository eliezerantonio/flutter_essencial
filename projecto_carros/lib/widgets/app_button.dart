import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key key, this.onPressed, this.text}) : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 400,
      child: RaisedButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
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
