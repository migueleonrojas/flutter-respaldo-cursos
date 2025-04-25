import 'package:flutter/material.dart';

//_HomeScreen: con el _ como prefijo conviertes la clase a privada
class HomeScreen extends StatelessWidget {
  //key: me sirve para identificar un widget propiamente dentro del contexto
  // puede servir porque si creas un paquete o algo personalizado, necisitan el key para hacer
  // referencia a su widget
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* TextStyle fontSize30 = const TextStyle(fontSize: 30); */
    const fontSize30 = TextStyle(fontSize: 30);
    int counter = 10;
    //throw UnimplementedError(); //si se da el error es porque esto no esta implementado, se tiene que resolver, esto ayuda en enfocarse en otras cosas y luego regresar a este punto
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 10.0,
      ),
      body: Center(
        //centra basado en el widget mas ancho
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center, //alinea relativamente al hijo mas grande que posea el column
          children: <
                  Widget> /*obliga que todo el contenido del array sea un widget, es opcional colocarlo*/
              [
            const Text(
              'Numero de clicks',
              style:
                  fontSize30, //cuando se usa variables entonces el children no puede ser const, ya que no sabemos que valor puede obtener esta variable antes de usarse aqui
            ),
            Text(
              '$counter',
              style:
                  fontSize30, // pero se declaro esto como una constante en la linea 13 y ahora se debe colocar const en el children
            )
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counter++; //se modifica el valor, pero no se redibuja el widget que contiene este valor nuevo, ya que estamos en un StatelessWidget el cual solo se dibuja una sola vez
          print('hola');
        },
      ),
    );
  }
}
