import 'package:flutter/material.dart';
import 'package:studiogenesis/clases/clases.dart';



class DetallesScreen extends StatelessWidget {
  final Pokemon pokemon;

  DetallesScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Aumentar el tamaño de la imagen de la api
            Image.network(
              pokemon.imageUrl,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(height: 10),
            Text('Tipo: ${pokemon.types}'),
            SizedBox(height: 8),
            Text('Altura: ${pokemon.height} m'),
            SizedBox(height: 8),
            Text('Peso: ${pokemon.weight} kg'),
          ],
        ),
      ),
    );
  }
}
