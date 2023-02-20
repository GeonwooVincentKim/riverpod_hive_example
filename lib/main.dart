import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primaryColor: Colors.amber),
      home: Home(),
    );
  }
}
