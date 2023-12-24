import 'package:flutter/material.dart';
import 'package:to_do_app/views/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  TodoTile({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Checkbox(
            value: todo.done,
            onChanged: (newValue) {
              Provider.of<TodoProvider>(context, listen: false)
                  .toggleDone(todo.id);
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .deleteTodo(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
