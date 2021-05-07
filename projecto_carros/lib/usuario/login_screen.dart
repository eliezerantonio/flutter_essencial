import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/helpers/scaffold_messenger.dart';
import 'package:projecto_carros/usuario/login_api.dart';
import 'package:projecto_carros/usuario/usuario.dart';
import 'package:projecto_carros/carro/home_screen.dart';
import 'package:projecto_carros/widgets/app_button.dart';
import 'package:projecto_carros/widgets/app_text.dart';
import 'package:projecto_carros/helpers/nav.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerLogin = TextEditingController( text: "user");

  final _controllerSenha = TextEditingController(text: "123");

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();
  bool _showProgress = false;

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
        _showProgress
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AppButton(
                text: "Login",
                onPressed: _onClikLogin,
              ),
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
    setState(() {
      _showProgress = true;
    });
    ApiResponse apiResponse = await LoginApi.login(login, senha);

    if (apiResponse.ok) {
      Usuario user = apiResponse.result;
      print(user);
      push(context, HomeScreen(), replace: true);
    } else {
      messenger(context, apiResponse.msg);
    }
    setState(() {
      _showProgress = false;
    });
  }

  String _validatorLogin(
    String value,
  ) {
    if (value.trim().isEmpty) {
      return "Digite o login";
    }
    if (value.length < 3) {
      return "O login precisa ter 3 digitos";
    }
    return null;
  }

  String _validatorSenha(
    String value,
  ) {
    if (value.trim().isEmpty) {
      return "Digite a Senha";
    }
    if (value.length < 3) {
      return "A senha precisa ter 3 digitos";
    }
    return null;
  }
}
