import 'package:basico_e_widgets/models/dog.dart';
import 'package:basico_e_widgets/screens/dog_screen.dart';
import 'package:basico_e_widgets/utils/nav.dart';
import 'package:flutter/material.dart';

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    final List<Dog> dogs = [
      Dog(nome: "Jack Russel", foto: "assets/images/dog1.png"),
      Dog(nome: "Labrador", foto: "assets/images/dog2.png"),
      Dog(nome: "Pug", foto: "assets/images/dog3.png"),
      Dog(nome: "Rottweiller", foto: "assets/images/dog4.png"),
      Dog(nome: "Pastor", foto: "assets/images/dog5.png"),
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          //SizedBox.Expanded
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 300,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          //SizedBox.Expanded
          return _itemView(dogs, index);
        },
      );
    }
  }

  Widget _itemView(List<Dog> dogs, int index) {
    return GestureDetector(
      onTap: () {
        push(
            context,
            DogScreen(
              dog: dogs[index],
            ));
      },
      child: Stack(
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
      ),
    );
  }
}

_img(String foto) {
  return Image.asset(
    foto,
    fit: BoxFit.cover,
  );
}
