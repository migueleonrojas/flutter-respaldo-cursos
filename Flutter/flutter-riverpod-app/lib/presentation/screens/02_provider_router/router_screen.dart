import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/router/app_router.dart';


class RouterScreen extends ConsumerWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider + Go Router'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: () {
          
          // no se va hacer lo esto 👉 ref.watch(provider) 
          // porque no se puede redibujar la funcion
          // el watch es cuando ustedes quieran redibujar sus widgets
          // dentro de un metodo no se puede hacer eso, esto le puede dar errores o crashear la aplicacion
          // o va tener muchas warnings y otras cosas
          // CUANDO ESTEN EN UNA FUNCION O METODO COMO EL CICLO DE VIDA, DEL INIT STATE O DESTROY,
          // vamos a usar el read, solo van a leerlo no van a actualizar la pantalla o sus widgets

          final appRouter = ref.read(appRouterProvider);

          appRouter.pop();




        },
      ),
    );
  }
}