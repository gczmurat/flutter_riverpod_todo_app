import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/models/todo_model.dart';
import 'package:flutter_todo_app/providers/todo_list_manager.dart';

final todoListProvider = StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([]);
});