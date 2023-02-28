import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/dummy/todo_dummy.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/shared/helpers/functions.dart';

class TodoRiverPod with ChangeNotifier {
  final List<Todo> _todoItems = DUMMY_TODO.toList();
  final List<Todo> _todoList = [];
  // late Todo _selectedTodo;
  final Todo _selectedTodo = Todo(id: '', contents: '', date: '', isDone: false, title: '');

  List<Todo> get todo => [..._todoItems];
  List<Todo> get todoList => [..._todoList];
  // Todo? get selectedTodo => Todo.from(_selectedTodo);
  // Todo? get selectedTodo => _selectedTodo != null ? Todo.from(selectedTodo!) : null;

  void createTodo(Map<String, dynamic> menuCreate) {
    menuCreate['id'] = getRandomString(2);
    final Todo todoSettings = Todo.fromJSON(menuCreate);
    _todoItems.add(todoSettings);
    notifyListeners();
  }
  
  void deleteTodo(Map<String, dynamic> menuCreate) {
    _todoItems.removeWhere((item) => item.id == menuCreate['id']);
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todoItems.add(todo);
    notifyListeners();
  }
}
