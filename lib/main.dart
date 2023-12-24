import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/views/home_page.dart';
import 'package:to_do_app/views/todo_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(color: Colors.yellow)),
      darkTheme: ThemeData.dark(),//not working
      home: HomePage(),
    );
  }
}
