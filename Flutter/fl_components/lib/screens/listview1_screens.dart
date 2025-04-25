import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);

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
          title: const Center(child: Text('Listview Tipo 1')),
        ),
        body: ListView(
          children: [
            //.map obtiene cada elemento de la lista y lo puedes transformar o devolver como desees
            //options.map = es un interable y se convierte en una lista con el metodo toList(),
            //pero no puede estar una lista en un elemento del children, para eso esta el operador
            //"..." que despliega los elementos de la lista
            ...options
                .map((game) => ListTile(
                      title: Text(game),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ))
                .toList(),
            const Divider()

            /* ListTile(
              title: Text('Hola mundo'),
              leading: Icon(Icons.access_alarm_sharp),
            ), */
          ],
        ));
  }
}
