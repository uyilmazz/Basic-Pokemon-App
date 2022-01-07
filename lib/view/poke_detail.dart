import 'package:basicpokemonapp/model/pokemon.dart';
import 'package:basicpokemonapp/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.teal),
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius:
                        BorderRadius.circular(context.dynamicWidth(0.05))),
                height: context.dynamicHeight(0.7),
                width: context.dynamicWidth(0.8),
                child: buildPokemonInfo(context),
              ),
            ),
          ),
          Positioned(
              top: context.dynamicHeight(-0.02),
              right: context.dynamicWidth(0.3),
              child: buildPokemonAvatar(context))
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text('${pokemon.name}'),
      centerTitle: true,
    );
  }

  Padding buildPokemonInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.dynamicHeight(0.08)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('${pokemon.name}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Height : ${pokemon.weight}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Weight : ${pokemon.height}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          buildColumn('Types', pokemon.type, context, Colors.orange),
          buildColumn('Weakness', pokemon.weaknesses, context, Colors.red),
          buildColumnEvolution(
              'Next Evolution', pokemon.nextEvolution, context, Colors.green),
          buildColumnEvolution(
              'Prev Evolution', pokemon.prevEvolution, context, Colors.green),
        ],
      ),
    );
  }

  Column buildColumn(
      String title, List? item, BuildContext context, Color color) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
            alignment: WrapAlignment.center,
            spacing: context.dynamicWidth(0.02),
            children: item != null
                ? item.map((e) => buildChip(color, e)).toList()
                : [buildChip(color, 'Not Found')])
      ],
    );
  }

  Column buildColumnEvolution(
      String title, List? item, BuildContext context, Color color) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: context.dynamicWidth(0.02),
            children: item != null
                ? item.map((e) => buildChip(color, e.name)).toList()
                : title == 'Next Evolution'
                    ? [buildChip(color, 'This is the final form')]
                    : [buildChip(color, 'This is first form')])
      ],
    );
  }

  Widget buildPokemonAvatar(BuildContext context) {
    return Hero(
      tag: pokemon,
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            child: Image(
              image: NetworkImage(pokemon.img!),
              fit: BoxFit.cover,
            ),
          ),
          radius: context.dynamicWidth(0.2)),
    );
  }

  Chip buildChip(Color color, String text) {
    return Chip(
        backgroundColor: color,
        label: Text(text, style: const TextStyle(color: Colors.white)));
  }
}
