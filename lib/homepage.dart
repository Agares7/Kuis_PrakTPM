import 'package:flutter/material.dart';
import 'detailpage.dart';
import 'pokemon_data.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: listPokemon.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (context, index) {
          final PokemonData Pokemon = listPokemon[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            pokemon: Pokemon,
                          )));
            },
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.network(Pokemon.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Text(Pokemon.name),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
