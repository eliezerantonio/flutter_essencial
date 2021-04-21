import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() => Container(
        padding: EdgeInsets.all(16),
        child: _formularioLogin(),
      );

  ListView _formularioLogin() {
    return ListView(
      children: [
        _text("Login", "Digite o Login"),
        SizedBox(
          height: 20,
        ),
        _text("Senha", "Digite a senha", obscure: true),
        SizedBox(
          height: 20,
        ),
        _button("Login"),
      ],
    );
  }

  Container _button(String text) {
    return Container(
      height: 46,
      child: RaisedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  Widget _text(String label, String hint, {bool obscure = false}) {
    return TextFormField(
      obscureText: obscure,
      style: TextStyle(fontSize: 20, color: Colors.blue),
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
            color: Colors.grey,
          )),
    );
  }
}
