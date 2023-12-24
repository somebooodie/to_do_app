import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/views/todo_provider.dart';

class AddPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
        backgroundColor: Colors.yellow[700],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'your todo',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            Provider.of<TodoProvider>(context, listen: false)
                .addTodo(_controller.text);
            Navigator.of(context).pop();
          }
        },
        label: Text('Add'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.yellow[700],
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerFloat,
    );
  }
}
