import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';


class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo(String description) {
    var eklenecekModel =
        TodoModel(id: const Uuid().v4(), description: description);
    state = [...state, eklenecekModel];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: todo.description,
              completed: !todo.completed)
        else
          todo,
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: newDescription,
              completed: todo.completed)
        else
          todo
    ];
  }

  void remove(TodoModel silinecekTodo){
    state = state.where((element) => element.id != silinecekTodo.id).toList();
  }

  int unCompletedCount(){
    return state.where((element) => !element.completed).length;
  }
}
