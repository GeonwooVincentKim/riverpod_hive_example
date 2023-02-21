import 'package:flutter/material.dart';

class Modify extends StatefulWidget {
  const Modify({super.key});

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modify"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("일자"),
              ],
            )
          ],
        ),
      ),
    );
  }
}