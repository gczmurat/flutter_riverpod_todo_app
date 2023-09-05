import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/models/todo_model.dart';
import 'package:flutter_todo_app/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  final TodoModel item;
  TodoListItemWidget({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocusNode;
  late TextEditingController _textController;
  bool _hasFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFocusNode = FocusNode();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (isFocused) => {
        if (!isFocused)
          {
            setState(
              () => _hasFocus = false,
            ),
            ref.read(todoListProvider.notifier).edit(id: widget.item.id, newDescription: _textController.text)
          }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
          });
          _textFocusNode.requestFocus();
          _textController.text = widget.item.description;
        },
        leading: Checkbox(
          value: widget.item.completed,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(widget.item.id);
          },
        ),
        title: _hasFocus
            ? TextField(
                controller: _textController,
                focusNode: _textFocusNode,
              )
            : Text(widget.item.description),
      ),
    );
  }
}
