import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projecto_carros/widgets/app_button.dart';
import 'package:projecto_carros/widgets/app_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerLogin = TextEditingController();

  final _controllerSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

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
        AppText(
          label: "Login",
          hint: "Digite o Login",
          controller: _controllerLogin,
          validator: _validatorLogin,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(
          height: 20,
        ),
        AppText(
            label: "Senha",
            hint: "Digite a senha",
            controller: _controllerSenha,
            obscure: true,
            validator: _validatorSenha,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            nextFocus: _focusSenha),
        SizedBox(
          height: 20,
        ),
        AppButton(text: "Login", onPressed: _onClikLogin),
      ],
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
    if (value.trim().isEmpty) {
      return "Digite o login";
    }
    if (value.length < 4) {
      return "O login precisa ter 4 digitos";
    }
    return null;
  }

  String _validatorSenha(
    String value,
  ) {
    if (value.trim().isEmpty) {
      return "Digite a Senha";
    }
    if (value.length < 4) {
      return "A senha precisa ter 4 digitos";
    }
    return null;
  }
}
