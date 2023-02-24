import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/dummy/todo_dummy.dart';
import 'package:flutter_todo_list/data/model/todo.dart';

class TodoRiverPod with ChangeNotifier {
  final List<Todo> _todo = DUMMY_TODO.toList();
  final List<Todo> _todoItems = [];
  late Todo _selectedTodo;

  List<Todo> get todo => [..._todo];
  Todo? get selectedTodo => Todo.from(_selectedTodo);

  void addTodo(Todo todo) {
    _todoItems.add(todo);
    notifyListeners();
  }
}
