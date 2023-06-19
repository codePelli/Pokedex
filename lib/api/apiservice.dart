import 'dart:convert';
import '../clases/clases.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://pokeapi.co/api/v2/";

  Future<List<Pokemon>> getPokemons(int limit, int offset) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> results = data['results'];
      List<Pokemon> pokemons = [];

      for (int i = 0; i < results.length; i++) {
        if (i < results.length) {
          String url = results[i]['url'];
          final pokemonResponse = await http.get(Uri.parse(url));
          final pokemonData = json.decode(pokemonResponse.body);
          Pokemon pokemon = Pokemon.fromJson(pokemonData);
          pokemons.add(pokemon);
        }
      }

      return pokemons;
    } else {
      throw Exception('Failed to load');
    }
  }


  Future<Pokemon> getPokemonDetails(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$name'));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load pokemon details');
    }
  }
}
