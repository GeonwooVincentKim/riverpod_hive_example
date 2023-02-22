import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            key: widget.key,
            value: false,
            onChanged: (checked) {
              
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Testing"),
              Text("Testing"),
            ]
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.amber,
            ),
            onPressed: () {
              
            },
          )
        ],
      ),
    );
  }
}
