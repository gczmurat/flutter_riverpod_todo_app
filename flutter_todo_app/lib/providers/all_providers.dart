import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/models/todo_model.dart';
import 'package:flutter_todo_app/providers/todo_list_manager.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([]);
});

enum TodoListFilter { all, active, completed }

final todoListFilter =
    StateProvider<TodoListFilter>((ref) => TodoListFilter.all);

final filteredTodoList = Provider<List<TodoModel>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todoList = ref.watch(todoListProvider);
  switch(filter){
    case TodoListFilter.all:
    return todoList;
    case TodoListFilter.completed:
    return todoList.where((element) => element.completed).toList();
    case TodoListFilter.active:
    return todoList.where((element) => !element.completed).toList();
  }
});
