import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ));
}
