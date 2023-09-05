import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
    ToolBarWidget({
    super.key,
  });

  var _filter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filt){
    return _filter == filt ? Colors.purple : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int unCompletedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length;
      _filter = ref.watch(todoListFilter);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(unCompletedTodoCount == 0? "All Completed" :
          "${unCompletedTodoCount.toString()} Uncompleted Todos",
          overflow: TextOverflow.ellipsis,
        )),
        Tooltip(
          message: "All Todos",
          child: TextButton(
            style: TextButton.styleFrom(primary: changeTextColor(TodoListFilter.all)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.all;
            },
            child: const Text("All"),
          ),
        ),
        Tooltip(
          message: "Only Uncompleted Todos",
          child: TextButton(
            style: TextButton.styleFrom(primary: changeTextColor(TodoListFilter.active)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.active;
            },
            child: const Text("Active"),
          ),
        ),
        Tooltip(
          message: "Only Completed Todos",
          child: TextButton(
          style: TextButton.styleFrom(primary: changeTextColor(TodoListFilter.completed)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.completed;
            },
            child: const Text("Completed"),
          ),
        ),
      ],
    );
  }
}
