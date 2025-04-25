import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

/* Cuando se usa riverpod en un StatefulWidget se debe pasar a ConsumerStatefulWidget*/

class FamilyFutureScreen extends ConsumerStatefulWidget {  
  const FamilyFutureScreen({super.key});

  /* State<FamilyFutureScreen> createState() => _FamilyFutureScreenState(); <- asi estaba antes*/
  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

/* Y en donde dice State<FamilyFutureScreen>, debes colocar */
/* FamilyFutureScreenState asi estaba antes */
class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {

  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {

    //el ref que sirve para acceder a los providers ya se accede de manera global en el state
    //ya lo tiene disponible porque esta dentro de un statefulwidget
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));


    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon id $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data), 
          error: (error, stackTrace) => Text('$error'), 
          loading: () => const CircularProgressIndicator()
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon( Icons.exposure_minus_1 ),
            onPressed: () { 

              if(pokemonId <= 1) return;

              pokemonId--;

              setState(() {});
      
            },    
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon( Icons.add ),
            onPressed: () { 

              pokemonId++;

              setState(() {});

              
            },    
          ),
        ],
      )
    );
  }
}