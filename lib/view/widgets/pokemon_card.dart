import 'package:basicpokemonapp/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 3, child: buildFadeImage),
            Expanded(flex: 1, child: Text(pokemon.name!))
          ],
        ),
      ),
    );
  }

  FadeInImage get buildFadeImage => FadeInImage(
        image: NetworkImage(pokemon.img!),
        placeholder: const AssetImage('assets/loading.gif'),
      );
}
