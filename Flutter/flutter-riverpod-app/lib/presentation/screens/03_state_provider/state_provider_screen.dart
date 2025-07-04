import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final counter = ref.watch(counterProvider);
    final darkMode = ref.watch(darkModeProvider);
    final userName = ref.watch(usernameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1,),

            IconButton(
              icon: Icon(
                !darkMode ? Icons.light_mode_outlined: Icons.dark_mode_outlined
              ),
              onPressed: () {
                ref.read(darkModeProvider.notifier).toggleDarkMode();
              },
            ),

            Text(userName, style: TextStyle(fontSize: 25 )),

            TextButton.icon(
              icon: const Icon( Icons.add, size: 50,),
              label: Text('$counter', style: const TextStyle(fontSize: 100)),
              onPressed: () {

                // counterProvider => counterProvider.notifier, para poder acceder a los metodos del
                // provider
                ref.read(counterProvider.notifier).increaseByOne();

              },
            ),
            
            const Spacer( flex: 2 ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {

          ref.read(usernameProvider.notifier).changeName(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}