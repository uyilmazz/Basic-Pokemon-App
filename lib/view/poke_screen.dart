import 'package:basicpokemonapp/model/pokemon.dart';
import 'package:basicpokemonapp/utils/extension.dart';
import 'package:basicpokemonapp/view/poke_detail.dart';
import 'package:basicpokemonapp/view/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';


class PokeScreen extends StatelessWidget {
  final List<Pokemon>? pokeList;
  const PokeScreen({Key? key, @required this.pokeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildPaddingGridView(context),
    );
  }

  AppBar get buildAppBar => AppBar(
      backgroundColor: Colors.white,
      title: const Text('Poke App', style: TextStyle(color: Colors.black)),
      centerTitle: true);

  Padding buildPaddingGridView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.01),
          vertical: context.dynamicHeight(0.01)),
      child: buildGridView,
    );
  }

  Widget get buildGridView => GridView.builder(
      itemCount: pokeList == null ? 0 : pokeList!.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        Pokemon currentPokemon = pokeList![index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetail(pokemon: currentPokemon)));
            },
            child: Hero(
                tag: currentPokemon,
                child: PokemonCard(pokemon: currentPokemon)));
      });
}
