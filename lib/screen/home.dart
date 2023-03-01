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
  List<Todo> items = [];

  @override
  void initState() {
    setState(() {
      items = Provider.of<TodoRiverPod>(context, listen: false).todo;
      print("Is here??");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TodoTile(
                      itemIndex: index,
                      // Should I block this onDeleted part??
                      // Or I should block onDeleted inside the
                      // TodoTile.dart file?
                      onDeleted: () {
                        print("Checked click");
                        setState(() {
                          // items.removeAt(index);
                          Provider.of<TodoRiverPod>(context, listen: false).dropTodo(items[index]);
                        });
                      },
                      todo: items[index],
                    ),
                  );
                },
              ),
            )
          )
        ],
      ),
    );
  }
}
