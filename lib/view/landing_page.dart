import 'package:basicpokemonapp/model/pokemon.dart';
import 'package:basicpokemonapp/view/poke_screen.dart';
import 'package:basicpokemonapp/view/splash_screen.dart';
import 'package:basicpokemonapp/view_model/poke_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Pokemon>? pokeList;

  @override
  void initState() {
    super.initState();
    getAllPokemon();
  }

  Future<void> getAllPokemon() async {
    pokeList = await context.read<PokeViewModel>().getAllPoke();
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<PokeViewModel>().state == PokeState.loadingState
        ? const SplashScreen()
        : context.watch<PokeViewModel>().state == PokeState.loadedState
            ? PokeScreen(pokeList: pokeList)
            : const Center(child: Text('Something Happened'));
  }
}
