import 'package:basicpokemonapp/model/pokemon.dart';
import 'package:basicpokemonapp/service/poke_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum PokeState { initalizeState, loadingState, loadedState, errorState }

class PokeViewModel extends ChangeNotifier {
  final PokeService _pokeService = PokeService(Dio());
  PokeState state = PokeState.initalizeState;

  Future<List<Pokemon>?> getAllPoke() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    try {
      state = PokeState.loadingState;
      await Future.delayed(const Duration(seconds: 2));
      final pokeList = await _pokeService.getAllPokemon();
      int end = DateTime.now().millisecondsSinceEpoch;
      if (end - start < 2500) {
        await Future.delayed(Duration(milliseconds: ((end - start))));
      }

      state = PokeState.loadedState;
      notifyListeners();

      return pokeList;
    } catch (error) {
      state = PokeState.errorState;
      notifyListeners();
    }
  }
}
