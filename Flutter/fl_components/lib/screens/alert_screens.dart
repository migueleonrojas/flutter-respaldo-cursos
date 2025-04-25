
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:fl_components/theme/app_theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return  CupertinoAlertDialog(
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min, //los hijos determinan el tamano de la alerta
              children: const [
                Text('Este es el contenido de la alerta'),
                SizedBox(height: 10,),
                FlutterLogo(size: 100,)
              ]
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok')
              ),
            ],

          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    //mostrar un dialogo, en un stalefullwidget el context se obtiene dentro del state,
    //pero en el statelesswidget se debe pasar por un parametro
    showDialog(
        barrierDismissible:
            false, //cierra el dialogo cuando hacemos click en la sombra
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            elevation: 5,
            title: const Text('Titulo'),
            content: Column(
                mainAxisSize: MainAxisSize
                    .min, //los hijos determinan el tamano de la alerta
                children: const [
                  Text('Este es el contenido de la alerta'),
                  SizedBox(
                    height: 10,
                  ),
                  FlutterLogo(
                    size: 100,
                  )
                ]),
            //colocando botones en el dialogo que realizan una accion
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar')
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        /* style: ElevatedButton.styleFrom(//se puede sobre escribir los estilos globales
            backgroundColor: Colors.teal,
            shape: const StadiumBorder(),
            elevation: 0
          ), */
        onPressed: () => Platform.isAndroid 
            ? displayDialogAndroid(context) //metodo para generar el dialogo
            : displayDialogIOS(context), //metodo para generar el dialogo
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'Mostrar Alerta',
            style: TextStyle(fontSize: 16),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.primary,
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(
                context); //para cerrar la actual ventana y regresarse a la anterior, elimina la ultima pantalla en el historial de screens
          }),
    );
  }
}
