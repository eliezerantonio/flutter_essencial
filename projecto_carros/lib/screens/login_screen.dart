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
        TextFormField(
          decoration: InputDecoration(
            labelText: "Login",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 46,
          child: RaisedButton(
            onPressed: () {},
            child: Text("Login"),
          ),
        ),
      ],
    );
  }
}
