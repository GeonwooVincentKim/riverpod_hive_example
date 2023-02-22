import 'package:flutter/material.dart';
import 'package:flutter_todo_list/widget/list_view/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TodoTile(widget: widget);
                }, 
              )
            )
          ],
        )
        // child: ListView.builder(itemBuilder: itemBuilder),
      ),
    );
  }
}
