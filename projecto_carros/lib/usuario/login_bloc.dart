import 'dart:async';

import 'package:projecto_carros/helpers/api_response.dart';
import 'package:projecto_carros/usuario/login_api.dart';
import 'package:projecto_carros/usuario/usuario.dart';
import 'package:provider/provider.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    _streamController.add(false);
  }

  void dispose() {
    _streamController.close();
  }
}
