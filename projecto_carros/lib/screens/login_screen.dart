import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  Widget _body() => Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: _formularioLogin(),
        ),
      );

  ListView _formularioLogin() {
    return ListView(
      children: [
        _text(
            label: "Login",
            hint: "Digite o Login",
            controller: _controllerLogin,
            validator: _validatorLogin),
        SizedBox(
          height: 20,
        ),
        _text(
          label: "Senha",
          hint: "Digite a senha",
          controller: _controllerSenha,
          obscure: true,
          validator: _validatorSenha,
        ),
        SizedBox(
          height: 20,
        ),
        _button("Login", _onClikLogin),
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

  Widget _text(
      {String label,
      String hint,
      TextEditingController controller,
      bool obscure = false,
      FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(fontSize: 20, color: Colors.blue),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      validator: validator,
    );
  }

  _onClikLogin() {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }
    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    print(login + " " + senha);
  }

  String _validatorLogin(
    String value,
  ) {
    if (value.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validatorSenha(
    String value,
  ) {
    if (value.isEmpty) {
      return "Digite a Senha";
    }
    return null;
  }
}
