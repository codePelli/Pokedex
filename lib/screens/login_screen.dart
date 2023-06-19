import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:studiogenesis/constants/constants.dart';
import 'home_screen.dart';
import 'package:studiogenesis/clases/login_guardado.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: SizedBox(
                          height: 120,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        kBotonInput.copyWith(
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6))
                        ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        kBotonInput.copyWith(
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6))
                        ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  ButtonLogin(
                    colour: Colors.black12,
                    title: 'LOG IN',
                    onPressed: () {
                      //Comprobar cuándo inició sesión
                      //TODO: Implementar LoginGuardado
                      //print('Han pasado dos días,vuelve a hacer login');
                      //Navigator.pushNamed(context, LoginScreen.id);
                      //TODO: Implementar inicio sesión
                      //Supongamos que usamos Firebase para el inicio de sesión:
                      //await FirebaseAuth.instance.signOut();
                      print('Iniciando sesión...');
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
