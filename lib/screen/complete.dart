import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/widget/list_view/todo_tile.dart';
import 'package:provider/provider.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final completeItems = context.watch<TodoRiverPod>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: completeItems.todoList.length,
                itemBuilder: (context, index) {
                  if (Provider.of<TodoRiverPod>(context).todoList[index].isDone == true) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TodoTile(
                        itemIndex: index,
                        onChanged: (checked) {
                          completeItems.todoList[index].isDone = checked!;
                          Provider.of<TodoRiverPod>(context, listen: false).updateTodo(completeItems.todoList[index]);
                          // setState(() {
                            
                          // });
                        },
                        onDeleted: () {
                          setState(() {
                            completeItems.todoList.removeAt(index);
                            Provider.of<TodoRiverPod>(context, listen: false).deleteTodo(index);
                          });
                        },
                        todo: completeItems.todoList[index],
                      ),
                    );
                  }
                },
              ),
            )
          )
        ],
      ),
    );
  }
}