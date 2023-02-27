import 'package:flutter/material.dart';
import 'package:flutter_todo_list/example/dialog/form_data/form_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: FormScreen(),
    );
  }
}
