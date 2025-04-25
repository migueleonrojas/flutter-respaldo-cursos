import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final pokemonName = ref.watch(pokemonNameProvider);
    
    // pokemonName: retorna un AsyncValue
    // Porque AsyncValue puede tener 3 valores, los cuales son:
    // 1. Cuando se completa
    // 2. Cuando esta cargando
    // 3. Cuando sucede un error

    // Cuando uno de estos 3 sucede entonces nosotros podemos reaccionar acorde a esos pasos


    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data), 
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('$error'), 
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon( Icons.refresh ),
            onPressed: () { 

              // invalidate: es como limpiar el estado y ejecutar nuevamente la funcion de pokemonName
              //ref.invalidate(pokemonNameProvider);

              ref.read(pokemonIdProvider.notifier).nextPokemon(); // cuando ejecutas este metodo entonces,
                                                                  // se va a llamar al proximo pokemon

                                                                  // se mantiene el ultimo valor y mantiene
                                                                  // en cache todos los demas valores anteriores
            },    
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon( Icons.minimize_outlined ),
            onPressed: () { 

              ref.read(pokemonIdProvider.notifier).previousPokemon();
              
            },    
          ),
        ],
      ),
    );
  }
}