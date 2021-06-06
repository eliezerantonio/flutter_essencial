import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final picker = ImagePicker();

  File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image.file(image)
                : Text("Nenhum imagem selecionada"),
            GestureDetector(
              onTap: _onClickCamera,
              child: Icon(Icons.camera, size: 40),
            ),
          ],
        ),
      ),
    );
  }

  Future<PickedFile> _onClickCamera() async {
    final imageP = await picker.getImage(source: ImageSource.camera);
    if (imageP != null) {
      setState(() {
        image = File(imageP.path);
      });
    }
  }
}
