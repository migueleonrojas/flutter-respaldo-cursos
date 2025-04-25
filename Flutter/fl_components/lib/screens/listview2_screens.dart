import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Listview Tipo 2')),
        ),
        //usando el widget pero con su contructor, se renderizara los hijos cuando este a la vista, es como un lazy load
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(options[index]),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                  onTap: () {
                    final game = options[index];
                    print(game);
                  }, //funcion que se ejecuta al tocar la opcion, agregar una animacion al tocar la opcion
                ),
            /* itemBuilder: (context, index) => Text(options[
                index]),  */ //index: posicion del elemento actual de la lista que se indico en 'itemCount'
            separatorBuilder: (_, __) =>
                const Divider(), //se colocan los nombres de los parametros con _ para indicar que no se van usar
            itemCount: options.length));
  }
}
