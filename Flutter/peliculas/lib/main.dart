import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';


void main() => runApp(AppState());//se coloca ahora la clase que mantiene el estado

class AppState extends StatelessWidget {//clase para mantener el estado de la aplicacion, en realidad se va a mantener el estado del movies_provider

  @override
  Widget build(BuildContext context) {
    return MultiProvider(//aqui se pueden colocar varias intancias de varios providers
      providers: [
        //lazy:true(hasta que se necesite se crea la instancia del provider)
        //lazy:false(tan pronto es creado este widget AppState(), se crea la instancia del provider)
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false,)//aqui se realiza la inicializacion de la instancia del movies provider, se va a tener acceso a la instancia de este provider en toda la aplicacion, ya que esta en el widget padre que engloba todos los widgets de la aplicacion
      ],
      child: const MyApp(), //ahora el MyApp, es el hijo de la clase que mantiene el estado
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}