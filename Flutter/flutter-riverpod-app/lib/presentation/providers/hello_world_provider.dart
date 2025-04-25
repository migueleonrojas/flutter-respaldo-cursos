
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'hello_world_provider.g.dart'; //<- archivo auto generado, que debe tener el mismo nombre que este 
                                    //   archivo actual

@riverpod
String helloWorld(Ref ref) { 
  //<- ref: para obtener la referencia a todos los otros providers que ya esten creados,
  // o que no esten creados pero cuando se accedan a el se van a crear
  return 'Hola Mundo';
}