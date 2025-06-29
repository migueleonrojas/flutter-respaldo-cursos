import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class ProviderScreen extends ConsumerWidget { //El provider se con el ConsumerWidget
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // este WidgetRef no es igual al Ref ref del
                                                      // provider que se creo

    // accediendo al valor del provider recien creado
    final helloWorld = ref.watch(helloWorldProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(helloWorld),
      ),
    );
  }
}