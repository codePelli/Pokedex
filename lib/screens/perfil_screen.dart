import 'package:flutter/material.dart';
import 'package:studiogenesis/Screens/login_screen.dart';
import 'package:studiogenesis/clases/clases.dart';

class PerfilScreen extends StatefulWidget {
  static const String id = 'perfil_screen';

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  late String _nombre;
  late String _apellido;
  late String _email;
  late DateTime _fechaNacimiento;
  late String _contrasena;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account settings'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombre = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Surname',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert your surname';
                  }
                  return null;
                },
                onSaved: (value) {
                  _apellido = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert an email';
                  }
                  if (!value.contains('@')) {
                    return 'Insert a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Date of birth',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert a date of birth';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fechaNacimiento = DateTime.parse(value!);
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert a password';
                  }
                  if (value.length < 6) {
                    return 'Password must have at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contrasena = value!;
                },
              ),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          //Validar formulario
                          if (_formKey.currentState!.validate()) {
                            //Guardar valores en las variables
                            _formKey.currentState!.save();
                            // TODO: Guardar los datos en BBDD
                          }
                        },
                        child: const Text('Save changes'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                          },
                        child: const Text('Disconnect'),
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
