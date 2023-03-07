import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/widget/list_view/todo_tile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = context.watch<TodoRiverPod>();
  
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.todoList.length,
                itemBuilder: (context, index) {
                  // 
                  if (Provider.of<TodoRiverPod>(context).todoList[index].isDone == false) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TodoTile(
                        itemIndex: index,
                        // onChanged: (checked) {
                        //   items.todoList[index].isDone = checked!;
                        //   Provider.of<TodoRiverPod>(context, listen: false).updateTodo(items.todoList[index]);
                        // },
                        onDeleted: () {
                          setState(() {
                            items.todoList.removeAt(index);
                            Provider.of<TodoRiverPod>(context, listen: false).deleteTodo(index);
                          });
                        },
                        todo: items.todoList[index],
                      ),
                    );
                  } else {
                    Container();
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
