import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projecto_carros/models/login_api.dart';
import 'package:projecto_carros/screens/home_screen.dart';
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
      body: Center(
        child: _body(),
      ),
    );
  }

  Widget _body() => Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: _formularioLogin(),
        ),
      );

  Widget _formularioLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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

  _onClikLogin() async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }
    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;
    bool ok = await LoginApi.login(login, senha);

    if (ok) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } else {
      print("Login incorreto");
    }
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
