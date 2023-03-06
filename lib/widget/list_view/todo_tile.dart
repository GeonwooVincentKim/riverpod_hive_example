import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/widget/alert_dialog/custom_dialog/custom_material_alert_dialog.dart';
import 'package:flutter_todo_list/widget/alert_dialog/custom_dialog/custom_material_alert_dialog_modify.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatefulWidget {
  final int itemIndex;
  final Function(bool?)? onChanged;
  final Function onDeleted;
  final Todo todo;

  TodoTile({
    super.key,
    required this.itemIndex,
    required this.onChanged,
    required this.onDeleted,
    required this.todo
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        print("Get ID ?? -> ${widget.todo.id}");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomMaterialAlertDialogModify(getTodo: widget.todo);
            // return CustomMaterialAlertDialog(isAdd: false);
          }
        );
      },
      child: Material(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                key: widget.key,
                value: widget.todo.isDone,
                onChanged: (val) => widget.onChanged!(val),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.todo.title),
                  Text(widget.todo.date),
                ]
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.amber,
                  ),
                  onPressed: () => widget.onDeleted(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
