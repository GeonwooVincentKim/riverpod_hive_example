import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/widget/alert_dialog/custom_material_alert_dialog.dart';

class TodoTile extends StatefulWidget {
  final int itemIndex;
  final Function onDeleted;
  final Todo todo;

  TodoTile({
    super.key,
    required this.itemIndex,
    required this.onDeleted,
    required this.todo
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomMaterialAlertDialog(isAdd: false);
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
              Container(
                child: Checkbox(
                  key: widget.key,
                  value: false,
                  onChanged: (checked) {
                    
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.todo.title),
                  Text(widget.todo.contents),
                  // Text(widget.item.title),
                  // Text(widget.item.contents)
                ]
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
