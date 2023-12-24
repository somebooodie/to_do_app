import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/views/add_page.dart';
import 'package:to_do_app/views/todo_provider.dart';
import 'package:to_do_app/widget/todo_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          if (provider.todos.isEmpty) {
            return Center(
              child: Text(
                  'No todos yet!'), //if screen had no ToDo list items
            );
          }
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              return TodoTile(todo: provider.todos[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow[700],
      ),
    );
  }
}
