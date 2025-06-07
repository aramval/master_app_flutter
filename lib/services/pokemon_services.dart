import 'package:dio/dio.dart';
import 'package:master_app/mappers/pokemon_mapper.dart';

class PokemonServices {

  static getPokemon<String>(String pokemonId) async {
    final dio = Dio();
    
    try{
      final responsio = await dio.get('https://pokeapi.co/api/v2/pokemons/$pokemonId');
      final pokemon = PokemonMapper.pokeApiPokemonToEntity(responsio.data);
      return(pokemon, 'Datos obtenidos correctamente');
}catch (e){
  return (null, 'No se pudo obtener el pokèmon');
}

  }


}