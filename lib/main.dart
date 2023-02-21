import 'package:flutter/material.dart';
import 'package:flutter_todo_list/screen/add.dart';
import 'package:flutter_todo_list/screen/complete.dart';
import 'package:flutter_todo_list/screen/modify.dart';
import 'package:flutter_todo_list/screen/page_slider.dart';

void main() {
  // hive
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(primaryColor: Colors.amber),
      routes: {
        "/": (context) => const PageSlider(),
        "/complete": (context) => const Complete(),
        "/add": (context) => const Add(),
        "/modify": (context) => const Modify()
      },
      initialRoute: "/",
    );
  }
}
