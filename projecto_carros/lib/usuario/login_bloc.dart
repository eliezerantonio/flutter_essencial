import 'dart:async';

import 'package:projecto_carros/carro/simple_bloc.dart';
import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/usuario/login_api.dart';
import 'package:projecto_carros/usuario/usuario.dart';
import 'package:provider/provider.dart';

class LoginBloc {
  final buttonBloc = BooleanBloc();

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    buttonBloc.add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    buttonBloc.add(false);

    return response;
  }

  void dispose() {
    buttonBloc.dispose();
  }
}
