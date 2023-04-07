import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundTodos = [];

  @override
  void initState() {
    _foundTodos = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.menu,
              color: Colors.deepPurple,
              size: 40.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            )
          ]
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              children: [
                SearchBar(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                        child: const Text("All ToDos",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "TiltWarp",
                          color: Colors.deepPurple
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 100.0),
                        child: Column(
                          children: [
                            for(ToDo todoTask in _foundTodos.reversed)
                              ToDoItem(todoTask: todoTask, onTodoChanged: _handleTodoChanged, onDeleteItem: _deleteTodoItem,),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [ BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 0.0
                    )]
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: "Add a new todo task",
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addTodoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size(60.0, 60.0),
                      elevation: 20,
                    ),
                    child: const Text("+",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                        fontFamily: "Inter"
                    ),)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodoChanged(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((todo) => todo.id == id);
    });
  }

  void _addTodoItem(String toDo) {
    if(toDo.isNotEmpty) {
      setState(() {
        todosList.add(
            ToDo(id: DateTime
                .now()
                .millisecondsSinceEpoch
                .toString(),
                todoText: toDo)
        );
      });
      _todoController.clear();
    }
  }

  void _filterTodos(String enteredKeyword) {
    List<ToDo> result = [];
    if(enteredKeyword.isEmpty) {
      result = todosList;
    } else {
      result = todosList.where((toDo) => toDo.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundTodos = result;
    });
  }

  Widget SearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [BoxShadow(
          blurRadius: 10.0,
          spreadRadius: 0.0,
          color: Colors.black26
        )]
      ),
      child: TextField(
        onChanged: (value) {
          _filterTodos(value);
        },
        style: const TextStyle(
          fontSize: 18.0
        ),
        cursorColor: Colors.deepPurple,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.deepPurple,
              size: 22.0,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 25.0,
              maxHeight: 20.0,
            ),
            border: InputBorder.none,
            hintText: "Search Todos"
        ),
      ),
    );
  }
}
