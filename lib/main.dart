import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/state_management/todo_riverpod.dart';
import 'package:flutter_todo_list/screen/add.dart';
import 'package:flutter_todo_list/screen/complete.dart';
import 'package:flutter_todo_list/screen/modify.dart';
import 'package:flutter_todo_list/screen/page_slider.dart';
import 'package:provider/provider.dart';

void main() {
  // hive
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_ctx) => TodoRiverPod())
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(primaryColor: Colors.amber),
        routes: {
          "/": (context) => const PageSlider(),
          "/complete": (context) => const Complete(),
          "/add": (context) => const Add(),
          // "/add": (context) => (isAdd: true),
          "/modify": (context) => const Modify()
        },
        initialRoute: "/",
      ),
    );
  }
}
