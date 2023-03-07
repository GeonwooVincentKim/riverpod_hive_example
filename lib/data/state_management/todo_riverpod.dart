import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/dummy/todo_dummy.dart';
import 'package:flutter_todo_list/data/model/todo.dart';
import 'package:flutter_todo_list/shared/helpers/functions.dart';

class TodoRiverPod with ChangeNotifier {
  final List<Todo> _todoItems = DUMMY_TODO.toList();
  final List<Todo> _todoList = [];
  final List<Todo> _todoCompleteList = [];
  // late Todo _selectedTodo;
  Todo _selectedTodo = Todo(id: '', contents: '', date: '', isDone: false, title: '');
  late Todo _selectSingleTodo;

  List<Todo> get todoDummyList => [..._todoItems];
  List<Todo> get todoList => [..._todoList];
  List<Todo> get todoCompleteList => [..._todoCompleteList];
  // Todo? get selectedTodo => Todo.from(_selectedTodo);
  Todo? get selectedTodo => _selectedTodo != null ? Todo.from(_selectSingleTodo) : null;

  void selectTodo(Todo todo) {
    _selectSingleTodo = todo;
    notifyListeners();
  }

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

    print("Get CreateTodo.id -> ${createTodo.id}");

    _todoList.add(todoSets);
    notifyListeners();
  }

  void updateTodoMap(Map<String, dynamic> menuUpdate) {
    final Todo getTodoMap = Todo.fromJSON(menuUpdate);
    final int index = _todoList.indexWhere((element) => element.id == getTodoMap.id);

    if (index >= 0) {
      _selectSingleTodo = getTodoMap;
      _todoList[index] = getTodoMap;
    }

    notifyListeners();
  }

  void updateTodo(Todo updateTodo) {
    final Todo todoUpdateSets = Todo.from(updateTodo);
    final int index = _todoList.indexWhere((element) => element.id == todoUpdateSets.id);

    print("Get ID -> ${todoUpdateSets.id}");
    print("Get Index -> $index");


    if (index >= 0) {
      // _selectedTodo = todoUpdateSets;
      _todoList[index] = todoUpdateSets;
    }

    notifyListeners();
  }

  void updateCompletTodo(Todo completeTodo) {
    final Todo todoCompleteUpdate = Todo.from(completeTodo);
    final int index = _todoCompleteList.indexWhere((element) => element.id == todoCompleteUpdate.id);

    print("Get Complete ID -> ${todoCompleteUpdate.id}");
    print("Get Complete Index -> $index");

    if (index >= 0) {
      _todoCompleteList[index] = todoCompleteUpdate;
    }

    notifyListeners();
  }

  void checkCompletedTodo(Map<String, dynamic> completeTodo) {
    final Todo getCompleteTodo = Todo.fromJSON(completeTodo);

    
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

  // void checkCompleted(bool isDone) {
  //   _selectedTodo.isDone = isDone;
  //   notifyListeners();
  // }

  void checkCompleted(Todo selectTodo, bool isComplete) {
    // final Todo todoCheckComplete = Todo.from(selectTodo);
    _selectedTodo.isDone = isComplete;

    // if (isComplete) {
    //   _todoCompleteList.add(todoCheckComplete);
    //   _todoList.remove(selectTodo);
    // } else {
    //   _todoList.add(todoCheckComplete);
    //   _todoCompleteList.remove(selectTodo);
    // }

    // isComplete ? 
    //   _todoCompleteList.add(todoCheckComplete) : 
    //   _todoList.add(todoCheckComplete);
    // _todoList.removeAt(index);
    notifyListeners();
  }
}
