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
        title: const Text('Ajustes de cuenta'),
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
                  labelText: 'Nombre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduce un nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombre = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduce un apellido';
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
                    return 'Introduce un email';
                  }
                  if (!value.contains('@')) {
                    return 'Introduce un email válido';
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
                  labelText: 'Fecha de nacimiento',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduce una fecha de nacimiento';
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
                  labelText: 'Contraseña',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Introduce una contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
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
                        child: const Text('Guardar cambios'),
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
                        child: const Text('Desconectar'),
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
