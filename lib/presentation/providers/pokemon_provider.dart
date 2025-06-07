import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_app/config/entities/pokemon.dart';
import 'package:master_app/services/pokemon_services.dart';

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id)async {
  final(pokemon, error) = await PokemonServices.getPokemon(id);

  if(pokemon != null) return pokemon;

  throw error;
});