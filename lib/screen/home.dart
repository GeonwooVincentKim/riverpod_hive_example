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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Checkbox(
                key: widget.key,
                value: false,
                onChanged: (checked) {
        
                },
              ),
              const Expanded(
                // child: Column(
                //   children: [
                //     Text(
                //       "Testing",
                //       style: TextStyle(
                //         fontSize: 22,
                //         color: Colors.black,
                //         decoration: TextDecoration.lineThrough
                //       )
                //     ),
                //     Text(
                //       "Date",
                //       style: TextStyle(
                //         fontSize: 22,
                //         color: Colors.black,
                //         decoration: TextDecoration.lineThrough
                //       )
                //     ),
                //   ],
                // ),
                child: Text(
                  "Testing",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    decoration: TextDecoration.lineThrough
                  )
                ),
              ),
              const Expanded(
                child: Text(
                  "Testing",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    decoration: TextDecoration.lineThrough
                  )
                ),
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
        )
        // child: ListView.builder(itemBuilder: itemBuilder),
      ),
    );
  }
}
