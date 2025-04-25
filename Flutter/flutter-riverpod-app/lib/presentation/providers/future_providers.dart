import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';


@Riverpod(keepAlive: true)
Future<String> pokemonName (Ref ref) async {

  final pokemonId = ref.watch(pokemonIdProvider); // se coloca para mantenerse vivo 
                                                  // (@Riverpod(keepAlive: true)) , ya que si se
                                                  // elimina entonces, puede romper al otro

  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);


  ref.onDispose(() {
    print('Estamos a punto de eliminar este provider');
  });

  return pokemonName;

}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {

  @override
  int build() {
    return 1;
  }

  void nextPokemon() {
    state++;
  }

  void previousPokemon() {

    if(state > 1) {

      state--;

    }

  }

}


/// Anteriormente llamados Family
@Riverpod(keepAlive: true)
Future<String> pokemon(Ref ref, int pokemonId) async {  //int pokemonId= si quieren recibir el argumento desde fuera

  
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

  return pokemonName;

} 
