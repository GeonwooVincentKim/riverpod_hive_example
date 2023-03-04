import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/dummy/todo_dummy.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/shared/helpers/functions.dart';

class TodoRiverPod with ChangeNotifier {
  final List<Todo> _todoItems = DUMMY_TODO.toList();
  final List<Todo> _todoList = [];
  final List<Todo> _todoCompleteList = [];
  // late Todo _selectedTodo;
  final Todo _selectedTodo = Todo(id: '', contents: '', date: '', isDone: false, title: '');
  late Todo _selectSingleTodo;

  List<Todo> get todoDummyList => [..._todoItems];
  List<Todo> get todoList => [..._todoList];
  List<Todo> get todoCompleteList => [..._todoCompleteList];
  // Todo? get selectedTodo => Todo.from(_selectedTodo);
  Todo? get selectedTodo => _selectSingleTodo != null ? Todo.from(_selectSingleTodo) : null;

  void createTodo(Map<String, dynamic> menuCreate) {
    menuCreate['id'] = getRandomString(2);
    final Todo todoSettings = Todo.fromJSON(menuCreate);
    // _todoItems.add(todoSettings);
    _todoList.add(todoSettings);
    notifyListeners();
  }

  void addTodo(Todo createTodo) {
    createTodo.id = getRandomString(2);
    final Todo todoSets = Todo.from(createTodo);

    _todoList.add(todoSets);
    notifyListeners();
  }

  // void removeTodo()
  
  void deleteTodo(int index) {
    // _todoItems.removeAt(index);
    _todoList.removeAt(index);
    notifyListeners();
  }

  // void deleteTodo(Map<String, dynamic> menuCreate) {
  //   _todoItems.removeWhere((item) => item.id == menuCreate['id']);
  //   notifyListeners();
  // }

  void checkCompleted(bool isDone) {
    _selectedTodo.isDone = isDone;
    notifyListeners();
  }

  // void addTodo(Todo todo) {
  //   // _todoItems.add(todo);
  //   _todoList.add(todo);
  //   notifyListeners();
  // }

  // void dropTodo(Todo todo) {
  //   _todoItems.remove(todo);
  //   notifyListeners();
  // }
}
