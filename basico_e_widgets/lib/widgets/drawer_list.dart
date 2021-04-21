import 'package:flutter/material.dart';

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
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog1.png"),
              ),
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
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
