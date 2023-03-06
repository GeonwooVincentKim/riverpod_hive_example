import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';

class CustomCheckBox extends StatefulWidget {
  final Todo todo;
  final Function(bool?)? onChanged;

  const CustomCheckBox({
    super.key,
    required this.todo,
    required this.onChanged
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("완료 여부"),
          Checkbox(
            key: widget.key,
            value: widget.todo.isDone,
            onChanged: (val) => widget.onChanged!(val),
          )
        ],
      )
    );
   
  }
}