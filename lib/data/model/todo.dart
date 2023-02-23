import 'package:flutter/material.dart';

class Todo {
  final String title;
  String contents;
  String date;
  bool isDone;

  Todo({
    required this.title,
    required this.contents,
    required this.date,
    required this.isDone
  });

  factory Todo.from(Todo todo) {
    return Todo(
      title: todo.title,
      contents: todo.contents,
      date: todo.date,
      isDone: todo.isDone
    );
  }
}
