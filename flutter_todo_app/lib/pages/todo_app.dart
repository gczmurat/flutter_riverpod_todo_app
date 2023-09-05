import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/providers/all_providers.dart';
import 'package:flutter_todo_app/widgets/title_widget.dart';
import 'package:flutter_todo_app/widgets/todo_list_item_widget.dart';
import 'package:flutter_todo_app/widgets/toolbar_widget.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(filteredTodoList);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            decoration:
                const InputDecoration(labelText: "Bugün Neler Yapacaksın"),
            controller: newTodoController,
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
          ),
          const SizedBox(
            height: 20,
          ),
            ToolBarWidget(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(allTodos[i].id),
                onDismissed: (_) {ref.read(todoListProvider.notifier).remove(allTodos[i]);},
                child: TodoListItemWidget(item: allTodos[i]))
        ],
      ),
    );
  }
}
