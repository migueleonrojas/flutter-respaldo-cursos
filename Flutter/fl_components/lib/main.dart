import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';
/* import 'screens/screens.dart'; */ //este archivo contiene todas las importaciones de todos los archivos de la carpeta screens

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      /* home: const ListView2Screen(), */
      initialRoute: AppRoutes.initialRoute,
      //definiendo las rutas, las rutas estan en una clase como propiedad estatica
      //se debe colocar en la propiedad estatica el tipo de dato que devuelve
      routes: AppRoutes.getAppRoutes(),
      //para trabajar con rutas dinamicas, son las que no estan definidas y aqui se generan
      /* onGenerateRoute: (settings) {
        //imprime la ruta que se esta intentando navegar pero no esta definida, se va a generar
        print(settings);

        //retornas la ruta con el widget al cual se va a dirigir
        return MaterialPageRoute(builder: (context) => const AlertScreen());
      }, */
      // tambien se trasladara esta funcion de la ruta dinamica a un metodo estatico, donde el metodo
      // debe especificar el tipo de dato que devuelve y los tipos de argumentos que recibe
      // se le debe pasar los parametros del "onGenerateRoute:" al "AppRoutes.onGenerateRoute"
      // pero como es un solo parametro y ese mismo parametro es el que se va a pasar, se puede solo colocar la referencia de la funcion
      // quedaria asi si pasaras los parametros =  onGenerateRoute: (settings) =>  AppRoutes.onGenerateRoute(settings));
      onGenerateRoute: AppRoutes
          .onGenerateRoute, //ahi qieda asi sin pasar los parametros ya que solo posee 1 y es el que estas pasando
      //para indicar los temas globales de la aplicacion
      theme: AppTheme
          .lightTheme, //tema que esta como propiedad estatica en una clase aparte
    );
  }
}
