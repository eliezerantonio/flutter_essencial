import 'package:basico_e_widgets/models/dog.dart';
import 'package:flutter/material.dart';

class DogScreen extends StatelessWidget {
  const DogScreen({Key key, this.dog}) : super(key: key);
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Container(
        child: Image.asset(dog.foto),
      ),
    );
  }
}
