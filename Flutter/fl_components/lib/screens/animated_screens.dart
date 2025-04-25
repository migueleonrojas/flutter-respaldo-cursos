import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  //se usa StatefulWidget, para poder cambiar las propiedades y porque se trabaja mejor el animated container, y se redibuje el widget con las propiedades cambiadas

  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50; // _ guion bajo para indicar que es una propiedad privada
  double _height = 50;
  Color _color = Colors.teal;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape() {
    final random = Random();

    _width = random.nextInt(300).toDouble() + 70;
    _height = random.nextInt(300).toDouble() + 70;

    _color = Color.fromRGBO(
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextInt(255), 
      1
    );
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(//container en donde se animan los cambios del estado
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCubic,//tipo de animacion
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.play_circle_outline,
          size: 35,
        ),
        onPressed: changeShape,
      ),
    );
  }
}
