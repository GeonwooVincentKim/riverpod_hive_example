import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
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
                Text("Testing222"),
                Text("Testing222"),
              ]
            ),
            Expanded(
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
        )
        // child: ListView.builder(itemBuilder: itemBuilder),
      ),
    );
  }
}