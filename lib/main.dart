import 'package:flutter/material.dart';
import 'package:studiogenesis/screens/crear_screen.dart';
import 'package:studiogenesis/screens/home_screen.dart';
import 'package:studiogenesis/screens/lista_screen.dart';
import 'package:studiogenesis/screens/perfil_screen.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(practica());
}

class practica extends StatelessWidget {
  const practica({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ListaScreen.id: (context) => ListaScreen(),
        CrearScreen.id: (context) => CrearScreen(),
        PerfilScreen.id: (context) => PerfilScreen(),
      },
    );
  }
}