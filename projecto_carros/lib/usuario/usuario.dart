import 'dart:convert' as convert;

import 'package:projecto_carros/helpers/prefs.dart';

class Usuario {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user_prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user_prefs");
    Map map = convert.json.decode(json);

    Usuario user = Usuario.fromJson(map);
    return user;
  }

  @override
  String toString() {
    return "Usuario(login: $login, nome: $nome, email: $email, token: $token, roles: $roles)";
  }
}
