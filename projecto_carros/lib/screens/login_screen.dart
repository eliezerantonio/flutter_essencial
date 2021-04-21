import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerSenha = TextEditingController();

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
        _text("Login", "Digite o Login", _controllerLogin),
        SizedBox(
          height: 20,
        ),
        _text("Senha", "Digite a senha", _controllerSenha, obscure: true),
        SizedBox(
          height: 20,
        ),
        _button("Login", () => _onClikLogin()),
      ],
    );
  }

  Container _button(String text, Function onPressed) {
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

  Widget _text(String label, String hint, TextEditingController controller,
      {bool obscure = false}) {
    return TextFormField(
      controller: controller,
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

  _onClikLogin() {
    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    print(login + " " + senha);
  }
}
