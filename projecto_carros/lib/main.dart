import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projecto_carros/favoritos/favoritos_model.dart';
import 'package:provider/provider.dart';

import 'usuario/login_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<FavoritosModel>(
            create: (context) => FavoritosModel(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
