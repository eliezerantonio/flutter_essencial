import 'package:flutter/material.dart';
import 'package:projecto_carros/helpers/nav.dart';
import 'package:projecto_carros/usuario/login_screen.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Eliezer Antonio"),
              accountEmail: Text("eliezer@gmail.com"),
              currentAccountPicture: CircleAvatar(),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Subtitulo"),
              subtitle: Text("Mais informacoes"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Mais informacoes"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
              trailing: Icon(Icons.arrow_forward),
              onTap: _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginScreen(), replace: true);
  }
}
