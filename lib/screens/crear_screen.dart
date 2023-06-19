import 'package:flutter/material.dart';
import 'package:studiogenesis/clases/clases.dart';
import 'package:studiogenesis/constants/constants.dart';
import 'package:build_daemon/constants.dart';

class CrearScreen extends StatefulWidget {
  static const String id = 'crear_screen';

  @override
  _CrearScreenState createState() => _CrearScreenState();
}

class _CrearScreenState extends State<CrearScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Pokemon> pokemonList = [];


  int _id = 0;
  String _name = '';
  int _height = 0;
  int _weight = 0;
  List<String> _types = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Pokémon'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert an ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _id = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Height'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert a valid height';
                  }
                  return null;
                },
                onSaved: (value) {
                  _height = int.parse(value!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert a valid height';
                  }
                  return null;
                },
                onSaved: (value) {
                  _weight = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insert a valid type';
                  }
                  return null;
                },
                onChanged: (value) {
                  _types = value.split(',').map((e) => e.trim()).toList();
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text('CREATE A POKÉMON'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Pokemon pokemon = Pokemon(
                      id: _id,
                      name: _name,
                      height: _height,
                      weight: _weight,
                      types: _types,
                      imageUrl: '',
                    );
                    setState(() {
                      pokemonList.add(pokemon);
                    });
                  }
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(pokemonList[index].name),
                    subtitle: Text('ID: ${pokemonList[index].id}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                      color: Colors.red,),
                      onPressed: () {
                        setState(() {
                          pokemonList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
