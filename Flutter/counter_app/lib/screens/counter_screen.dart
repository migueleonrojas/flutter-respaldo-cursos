import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10; //se coloca como una propiedad la variable

  //funciones que se van a pasar por parametros al widget que contiene los botones
  void increase() {
    counter++;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('CounterScreen')),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Numero de clicks',
              style: fontSize30,
            ),
            Text(
              '$counter',
              style: fontSize30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //con esta propiedad si se centraria adecuadamente
      //se le esta pasando por parametro una funcion que sera el parametro del widget, que es parametro del constructor
      floatingActionButton: CustomFloatingActions(
        increaseFn:
            increase, //pasando la funciones por parametros al contructor del widget
        resetFn: reset,
        decreaseFn: decrease,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function
      increaseFn; //va a recibir una funcion por los parametros del constructor
  final Function resetFn;
  final Function decreaseFn;

  //este constructor va a recibir funciones en sus 3 ultimos parametros
  const CustomFloatingActions(
      {Key? key,
      required this.increaseFn,
      required this.resetFn,
      required this.decreaseFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //no se centra en todo el medio por su ubicacion ya que esta respetando las dimensiones del widget Scaffold
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
        /* const SizedBox(
          //caja invisible, lo puedes usar como separador de elementos
          width: 20.0,
        ), */
        FloatingActionButton(
          onPressed: () =>
              resetFn(), //ejecuta la propiedad que es una funcion, la cual es recibida cuando se hace la instancia de este widget
          child: const Icon(Icons.delete),
        ),
        /* const SizedBox(
          //caja invisible, lo puedes usar como separador de elementos
          width: 20.0,
        ), */
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}
