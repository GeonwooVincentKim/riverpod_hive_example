import 'package:flutter/material.dart';

class Todo {
  String id;
  String title;
  String contents;
  String date;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.contents,
    required this.date,
    required this.isDone
  });

  factory Todo.from(Todo todo) {
    return Todo(
      id: todo.id,
      title: todo.title,
      contents: todo.contents,
      date: todo.date,
      isDone: todo.isDone
    );
  }

  factory Todo.fromJSON(Map<String, dynamic> data) {
    return Todo(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      contents: data['contents'] ?? '',
      date: data['date'] ?? '',
      isDone: data['isDone'] ?? false
    );
  }
}
