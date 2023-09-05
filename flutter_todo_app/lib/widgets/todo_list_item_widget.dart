import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/models/todo_model.dart';

class TodoListItemWidget extends ConsumerWidget {
  const TodoListItemWidget({super.key, required TodoModel item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (value) {
          debugPrint(value.toString());
        },
      ),
      title: const Text(""),
    );
  }
}
