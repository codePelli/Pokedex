import 'package:flutter/material.dart';
import '../api/apiservice.dart';
import '../clases/clases.dart';
import 'detalles_screen.dart';
import 'package:studiogenesis/database/database.dart';

class ListaScreen extends StatefulWidget {
  static const String id = 'lista_screen';

  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  ApiService apiService = ApiService();
  late Future<List<Pokemon>> pokemons;
  String _searchText = "";
  final TextEditingController _searchController = TextEditingController();
  int pokemonsToShow = 10;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    pokemons = apiService.getPokemons(10, 0);
  }

  void BorrarPokemon(Pokemon pokemon) {
    setState(() {
      pokemons = pokemons.then((list) {
        list.remove(pokemon);
        return list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTA DE POKEMON'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Buscar en la Pokédex...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                  print(_searchText);
                });
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: pokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length + 1,
              itemBuilder: (context, index) {
                if (index == snapshot.data!.length) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pokemonsToShow += pageSize;
                        pokemons = apiService.getPokemons(pokemonsToShow, 0);
                      });
                    },
                    child: Text('Cargar más'),
                  );
                } else {
                  if (index < snapshot.data!.length) {
                    Pokemon pokemon = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetallesScreen(pokemon: pokemon)),
                        );
                      },
                      child: ListTile(
                        leading: Image.network(pokemon.imageUrl),
                        title: Row(
                          children: [
                            Text(pokemon.name),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                              },
                              child: Text('Editar'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                BorrarPokemon(pokemon);
                              },
                              child: Text('Borrar'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return Container();
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
