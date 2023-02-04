import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppToDoState(),
    child: MaterialApp(
      title: 'ToDo',
      home: HomeScreen(),
    ),
  ));
}

enum ToDoStatus { todo, inprogress, done, close, pending }

class ToDo {
  ToDo(this.id, this.name, this.content);

  int id = 0;
  String name;
  String content;
  int timeCreate = 0;
  int timeModifer = 0;
  int deadline = 0;
  ToDoStatus status = ToDoStatus.todo;
}

class AppToDoState extends ChangeNotifier {
  List<ToDo> todoList = [
    ToDo(0, 'hihi', 'akdfakjsfka'),
    ToDo(0, 'hihi', 'akdfakjsfka'),
    ToDo(0, 'hihi', 'akdfakjsfka'),
    ToDo(0, 'hihi', 'akdfakjsfka')
  ];

  void createNewToDo(String name, String content, int deadline) {
    ToDo toDo = ToDo(DateTime.now().millisecond, name, content);
    toDo.timeCreate = DateTime.now().millisecond;
    todoList.add(toDo);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: ToDoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogCreateNewToDo(context);
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.create),
      ),
    ));
  }

  void _showDialogCreateNewToDo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create ToDo'),
          content: _buildContentCreateToDoDialog(),
          actions: [
            TextButton(onPressed: () {}, child: Text('oke')),
            TextButton(onPressed: () {}, child: Text('cancel'))
          ],
        );
      },
    );
  }

  Widget _buildContentCreateToDoDialog() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(0),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'input title', border: OutlineInputBorder()),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 14),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'input content', border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppToDoState appToDoState = context.watch<AppToDoState>();
    return ListView(
      children: appToDoState.todoList.map((e) => CardToDo(toDo: e)).toList(),
    );
  }
}

class CardToDo extends StatelessWidget {
  CardToDo({required this.toDo});

  ToDo toDo;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Card(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  toDo.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  toDo.content,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                StatusView(ToDoStatus.inprogress),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}

class StatusView extends StatelessWidget {
  StatusView(this.status);

  ToDoStatus status;

  @override
  Widget build(BuildContext context) {
    MaterialColor color = Colors.blue;
    switch (status) {
      case ToDoStatus.todo:
        color = Colors.red;
        break;
      case ToDoStatus.inprogress:
        color = Colors.orange;
        break;
      case ToDoStatus.done:
        color = Colors.green;
        break;
      case ToDoStatus.close:
        color = Colors.yellow;
        break;
      default:
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      color: color,
      child: Text(
        status.name,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
