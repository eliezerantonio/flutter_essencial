import 'package:basico_e_widgets/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello page 2"),
      ),
      body: _body(context, "Voltar"),
    );
  }

  _body(BuildContext context, String text) {
    return Center(
      child: BlueButton(
        "Voltar",onPressed: 
        () => onClickVoltar(context),
      ),
    );
  }

  void onClickVoltar(BuildContext context) => Navigator.pop(context, "Tela 2");
}
