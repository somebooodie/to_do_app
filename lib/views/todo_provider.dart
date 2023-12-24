import 'package:flutter/material.dart';

class Todo {
  String id;
  String title;
  bool done;

  Todo({required this.id, required this.title, this.done = false});
}

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleDone(String id) {
    final todo = _todos.firstWhere((t) => t.id == id);
    todo.done = !todo.done;
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
