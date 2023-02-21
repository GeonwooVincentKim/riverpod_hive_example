import 'package:flutter/material.dart';

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
                Text("Testing"),
                Text("Testing"),
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
