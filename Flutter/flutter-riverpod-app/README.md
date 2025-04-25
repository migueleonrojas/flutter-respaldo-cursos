# riverpod_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

### Anotaciones de Miguel Leon

NOTA: Puede ser que algo cambie en la documentacion por eso la anexo [https://riverpod.dev/](https://riverpod.dev/)

Hay un comando que se tiene que mantener en ejecucion el cual es 

```bash
dart run build_runner watch
```

☝ este lo que hara es que si hay anotaciones que 
nosotros hagamos, y cuando encuentre un cambio, lo va a volver a generar.

**SIEMPRE TIENES QUE MANTENERLO EJECUTANDOSE CUANDO USES RIVERPOD**

---

### Para usar el provider de riperpod de manera global en la aplicacion

En el archivo se `main.dart` se va a realizar un ajuste.

```dart

void main() => runApp(
  const ProviderScope( child: MyApp())
);

```

---

### 1 Provider de solo lectura

> En el directorio `presentation/screen/01_provider/provider_screen.dart` se va a estar trabajando.

> Se crea el provider en `presentation/providers/hello_world_provider.dart` ahi esta explicado como se usa

### 2 Provider + Go Router

Construir la rutas de manera dinamica dependiendo de un estado.

Se va a transformar una instancia de GoRouter a un provider de solo lectura.

Se modificara el archivo `config/router/app_router.dart`

Se modificara el archivo `presentation\screens\02_provider_router\router_screen.dart`


### 3 Provider con cambios de estado

Se creo un archivo con los providers `presentation\providers\state_providers.dart`

Se va consumir el provider en el siguiente archivo `presentation\screens\03_state_provider\state_provider_screen.dart`

### 4 Provider con estado - Tarea

DarkMode => Nombre de Provider => es un boolean => false valor por defecto
void toggleDarkMode()


Username => String 
Default: `Melissa Flores`
changeName( String name)
userNameProvider.notifier).changeName(RandomGenerator.getRandomName())


Puntos extra: si hacen que el tema global de la aplicacion cambie

# 5 - Hizo la tarea en un video

# 6 - KeepAlive - Riverpod annotations

Se va a modificar 2 clases de estado

El Username y el Counter

# 7 - TODOs State Providers

Se va a crear un archivo en `presentation/providers/todos_providers.dart`

# 8 - TODOs Listado de invitados

Se va a crear otro provider en `presentation/providers/todos_providers.dart`

Se va a consumir el provider en `presentation/screens/04_todo/todo_screen.dart`

# 9 - TODOs Toggle

Se va a agregar un metodo al provider en `presentation/providers/todos_providers.dart`

Se va a consumir el provider en `presentation/screens/04_todo/todo_screen.dart`

# 10 - TODOs Aplicar el filtro seleccionado

Se realizo la tarea

```dart
@riverpod
List<Todo> filteredTodos(Ref ref) {

  //cuando se usa un provider dentro de otro siempre usar el ref.watch

  final List<Todo> todos = ref.watch(todosProvider);
  final FilterType filter = ref.watch(todoCurrentFilterProvider);

  List<Todo> todosFiltered = todos;

  if(filter == FilterType.pending) {
    todosFiltered = todos.where((todo) => !todo.done).toList();
  }

  else if(filter == FilterType.completed) {
    todosFiltered = todos.where((todo) => todo.done).toList();
  }

  return todosFiltered;


}
```

# 11 - Future Provider

Se va a consumir el provider en la pantalla que esta en `presentation/screens/05_future_provider/future_provider_screen.dart`

Se va a crear un nuevo provider llamado `presentation/providers/future_providers.dart`

# 12 - Provider invalidar y dependencias

Se va a consumir el provider en la pantalla que esta en `presentation/screens/05_future_provider/future_provider_screen.dart`

# 13 - Future provider con argumentos


Se va a trabajar en la siguiente pantalla `presentation/screens/06_family_future_provider/future_provider_screen.dart`

Se va a modificar el siguiente provider `presentation/providers/future_providers.dart`

# 14 - Stream Provider

Se va a crear un archivo llamado `presentation/providers/stream_provider.dart`

Se va a usar ese provider en `presentation\screens\07_stream_provider\stream_provider_screen.dart`








