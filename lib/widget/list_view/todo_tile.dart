import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';
import 'package:flutter_todo_list/widget/alert_dialog/custom_material_alert_dialog.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.widget,
  });

  final Home widget;

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
                children: const [
                  Text("Testing"),
                  Text("Testing"),
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
