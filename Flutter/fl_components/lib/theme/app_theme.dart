import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.teal;

  //se coloca final porque se debe se crear una instancia
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary, 
      elevation: 0
    ),
    //modificando el color del texto de los botones de forma global
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: primary)),
    //floating actions buttons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5
    ),
    //ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        shape: const StadiumBorder(),
        elevation: 0
      )
    ),
    //inputdecorationtheme
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),//cambiando el color del label del input
      enabledBorder: OutlineInputBorder(//bordes cuando el input esta habilitado
        borderSide: BorderSide(
          color: primary
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),

      focusedBorder: OutlineInputBorder(//bordes cuando el input tenga el foco
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
      ),
      border: OutlineInputBorder( //se aplica cuando no tenga el foco y esten habilitados
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
    )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary, 
      elevation: 0
    ),
    scaffoldBackgroundColor: Colors.black,
    
  );

 
}
