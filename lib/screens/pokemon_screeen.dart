import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

/// Use widgets: [GridView.builder], [Card], [Text] and [Image.network] to display the list of pokemon
/// given by the variable [pokemon].
class PokemonScreen extends StatelessWidget {
  final pokemon = getPokemon();

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Pokemon',
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: pokemon.length,
        itemBuilder: (context, index) {
          final pokemon = this.pokemon[index];
          return Card(
            child: Column(
              children: [
                
                Text(pokemon.name),
                Image.network(
                  pokemon.image,
                  width: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Pokemon> getPokemon() {
  return [
    Pokemon(id: 1, name: 'Bulbasaur'),
    Pokemon(id: 2, name: 'Ivysaur'),
    Pokemon(id: 3, name: 'Venusaur'),
    Pokemon(id: 4, name: 'Charmander'),
    Pokemon(id: 5, name: 'Charmeleon'),
    Pokemon(id: 6, name: 'Charizard'),
    Pokemon(id: 7, name: 'Squirtle'),
    Pokemon(id: 8, name: 'Wartortle'),
    Pokemon(id: 9, name: 'Blastoise'),
    Pokemon(id: 10, name: 'Caterpie'),
    Pokemon(id: 11, name: 'Metapod'),
    Pokemon(id: 12, name: 'Butterfree'),
    Pokemon(id: 13, name: 'Weedle'),
    Pokemon(id: 14, name: 'Kakuna'),
    Pokemon(id: 15, name: 'Beedrill'),
    Pokemon(id: 16, name: 'Pidgey'),
    Pokemon(id: 17, name: 'Pidgeotto'),
    Pokemon(id: 18, name: 'Pidgeot'),
    Pokemon(id: 19, name: 'Rattata'),
    Pokemon(id: 20, name: 'Raticate'),
    Pokemon(id: 21, name: 'Spearow'),
    Pokemon(id: 22, name: 'Fearow'),
    Pokemon(id: 23, name: 'Ekans'),
    Pokemon(id: 24, name: 'Arbok'),
    Pokemon(id: 25, name: 'Pikachu'),
    Pokemon(id: 26, name: 'Raichu'),
    Pokemon(id: 27, name: 'Sandshrew'),
    Pokemon(id: 28, name: 'Sandslash'),
  ];
}

class Pokemon {
  Pokemon({required this.id, required this.name});

  final int id;
  final String name;

  String get image => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}
