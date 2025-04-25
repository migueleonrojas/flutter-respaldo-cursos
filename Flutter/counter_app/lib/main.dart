import 'package:counter_app/screens/counter_screen.dart';
import 'package:flutter/material.dart';

//import 'package:counter_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp()); //para correr un widget
}

//creando mi widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(
            key:
                key); //se define el contructor y se llama al contructor de la clase padre

  //metodo para que la clase sea considerada un widget, este metodo retorna un widget
  //todo StatelessWidget tiene un metodo build

  @override
  Widget build(BuildContext context) {
    // MaterialApp: es un widget de flutter
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      home: CounterScreen(),
    );
  }
}
