import 'package:flutter/cupertino.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<dynamic> types = json['types'];
    List<String> typeNames = types.map((type) => type['type']['name'].toString()).toList();
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      height: json['height'],
      weight: json['weight'],
      types: typeNames,
    );
  }
}

class CreatePokemon extends ChangeNotifier {
  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  void addPokemon(Pokemon pokemon) {
    _pokemons.add(pokemon);
    notifyListeners();
  }
}

