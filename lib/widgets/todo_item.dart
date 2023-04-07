import 'package:flutter/material.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoTask;
  final onTodoChanged;
  final onDeleteItem;

  const ToDoItem({Key? key, required this.todoTask, required this.onTodoChanged, required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        onTap: () {
          onTodoChanged(todoTask);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: Colors.white,
        leading: Icon(
          todoTask.isDone ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.amber,
        ),
        title: Text(todoTask.todoText!, style: TextStyle(fontSize: 16, fontFamily: "Inter", fontWeight: FontWeight.w500, decoration: todoTask.isDone ? TextDecoration.lineThrough : null),),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12.0),
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todoTask.id);
            },
            icon: Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
