import 'package:flutter/material.dart';
import 'package:learning_flutter_app/todo/models/todo.dart';
import 'package:learning_flutter_app/todo/utils/DbHelper.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  DbHelper dbHelper = DbHelper();
  late List<ToDo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void getData() {
    final dbFuture = dbHelper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = dbHelper.getToDos();
      todosFuture.then((result) {
        List<ToDo> todoList = [];
        count = result.length;
        for (int i=0; i<count; i++) {
          todoList.add(ToDo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
      })
    });
  }
}

