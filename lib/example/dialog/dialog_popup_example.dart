import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String title = "MyApp";

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: title,
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController controller;
  String name = '';

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyApp.title), centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Name : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
                  )
                ),
                const SizedBox(width: 12),
                Text(name, style: const TextStyle(fontSize: 20))
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Open Dialog', style: TextStyle(fontSize: 20),),
              onPressed: () async {
                final name = await openDialog();
                if (name == null || name.isEmpty) return;


                setState(() => this.name = name);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Your Name'),
      content: TextField(
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Enter your name'),
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: submit,
          child: const Text('SUBMIT'),
        )
      ]
    )
  );

  void submit() {
    Navigator.of(context).pop(controller.text);
  }
}