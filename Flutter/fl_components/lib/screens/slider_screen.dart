import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(//es una barra de progreso
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue, 
            onChanged: _sliderEnable 
            ? (value) {
                _sliderValue = value;
                setState((){});
              }
            : null//significa que esta deshabilitado el widget
          ),
          Checkbox(
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});

            }
          ),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            }
          ),
          Switch(
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            }
          ),
          SwitchListTile.adaptive(//adaptive = diseno adaptativo para cualquier sistema operativo de telefono
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            }
          ),
          const AboutListTile(),//coloca el about sobre nuestra aplicacion, ver los derechos de autor, librerias que estas usando, paquetes que estas usando
          Expanded( //widget que sirve para tomar todo el alto y ancho posible 
            child: SingleChildScrollView(//si los hijos sobresalen de la pantalla, se podra hacer scroll
              child: Image(
                image: const NetworkImage('https://alejandroguipe.files.wordpress.com/2018/01/ven-ccs-avi-24oct15-106.jpg?w=1024'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          const SizedBox(height: 100,)
        ],
      )
    );
  }
}