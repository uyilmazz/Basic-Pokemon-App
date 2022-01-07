import 'package:basicpokemonapp/model/pokemon.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class PokeService {
  final Dio _dio;
  final String pokeDocURL =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  PokeService(this._dio);

  Future<List<Pokemon>?> getAllPokemon() async {
    final response = await _dio.get(pokeDocURL);

    if (response.data != null) {
      final decodeData = json.decode(response.data)['pokemon'] as List;
      return decodeData.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
