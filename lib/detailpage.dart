import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pokemon_data.dart';

class DetailPage extends StatelessWidget {
  final PokemonData pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pokemon.isFavorite = false;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Pokemon Detail'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
              ),
              tooltip: 'Add to favorite',
              onPressed: () {
                if (pokemon.isFavorite == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Berhasil Menambahkan ke Favorit'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  pokemon.isFavorite = true;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Berhasil Menghapus dari Favorit'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  pokemon.isFavorite = false;
                }
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pokemon.image.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        pokemon.image,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Text(
                pokemon.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Text(
                'Type : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.type.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.type[index]),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Text(
                'Weakness : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.weakness.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.weakness[index]),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Text(
                'Pre-Evolution : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.prevEvolution.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.prevEvolution[index]),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Text(
                'Next-Evolution : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemon.nextEvolution.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(pokemon.nextEvolution[index]),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
              child: ElevatedButton(
                  onPressed: () {
                    _launchInBrowser(pokemon.wikiUrl);
                  },
                  child: Text('Open in Fandom!')),
            )
          ],
        ));
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
