import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studiogenesis/main.dart';
import 'package:studiogenesis/screens/perfil_screen.dart';

import 'crear_screen.dart';
import 'lista_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(50.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ListaScreen.id);
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset('images/button.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'LISTA DE POKEMON',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(50.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, CrearScreen.id);
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          child: Image.asset('images/button.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'CREAR ENTRADA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(50.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PerfilScreen.id);
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          child: Image.asset('images/button.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'AJUSTES DE CUENTA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ]
            )),
      ),
    );
  }
}
