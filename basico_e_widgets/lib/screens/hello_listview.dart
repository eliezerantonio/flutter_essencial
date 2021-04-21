import 'package:basico_e_widgets/models/dog.dart';
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
    final List<Dog> dogs = [
      Dog(
        nome: "Jack Russel",
        foto: "assets/images/dog1.png",
      ),
      Dog(
        nome: "Labrador",
        foto: "assets/images/dog2.png",
      ),
      Dog(
        nome: "Pug",
        foto: "assets/images/dog3.png",
      ),
      Dog(
        nome: "Rottweiller",
        foto: "assets/images/dog4.png",
      ),
      Dog(
        nome: "Pastor",
        foto: "assets/images/dog5.png",
      ),
    ];

    return ListView.builder(
      itemExtent: 300,
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        //SizedBox.Expanded
        return Stack(
          fit: StackFit.expand,
          children: [
            _img(dogs[index].foto),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  dogs[index].nome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

_img(String foto) {
  return Image.asset(
    foto,
    fit: BoxFit.cover,
  );
}
