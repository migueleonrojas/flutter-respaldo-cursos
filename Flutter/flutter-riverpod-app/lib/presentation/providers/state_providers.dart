import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

/* @riverpod */ // <--- no mantiene el estado si se vuelve hacer la llamada del provider vuelve a su valor 
                //      por defecto
@Riverpod(keepAlive: true) // <- si mantiene el ultimo valor asignado sí se llama nuevamente el provider
class Counter extends _$Counter {

  //estado inicial
  @override
  int build() {
    return 5;
  }

  // metodo para incremetar los providers
  void increaseByOne() {
    state++;
  }

}

@riverpod
class DarkMode extends _$DarkMode {

  @override
  bool build() {
    return false;
  }

  void toggleDarkMode() {
    state = !state;
  }

}

@Riverpod(keepAlive: true)
class Username extends _$Username {

  @override
  String build() {
    return 'Melissa Flores';
  }

  void changeName(String name) {
    state = name;
  }

}

// DarkMode => Nombre de Provider => es un boolean => false valor por defecto
// void toggleDarkMode()


// Username => String 
// Default: `Melissa Flores`
// changeName( String name)
// userNameProvider.notifier).changeName(RandomGenerator.getRandomName())


// Puntos extra: si hacen que el tema global de la aplicacion cambie


