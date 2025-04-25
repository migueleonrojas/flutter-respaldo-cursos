
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {

  @override
  FilterType build(){
    return FilterType.all;
  }

  void setCurrentFilter(FilterType newFilter) {
    state = newFilter;
  }

}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {

  @override
   List<Todo> build() {
    return [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    ];
  }

  void createTodo( String description ) {

    state = [
      ...state, 
      Todo(id: uuid.v4(), description: description, completedAt: null)
    ];

  }

  void toggleTodo(String id) {

    state = state.map((todo) {

      if( todo.id == id ) {
        todo = todo.copyWith(
          completedAt: todo.done ? null : DateTime.now()
        );
      }

      return todo;

    }).toList();

  }

}


/// filteredTodos // SOLO LECTURA

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
