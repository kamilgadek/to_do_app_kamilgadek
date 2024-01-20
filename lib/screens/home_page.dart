import 'package:flutter/material.dart';
import 'package:to_do_app_koko/util/dialog_box.dart';
import 'package:to_do_app_koko/util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  //list of to do tasks to my ListView builder
  List toDoList = [
    ['Make tutorial', false],
    ['Do exercise', false],
  ];

  // method for check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index]
          [1]; // tworze to jako przeciwne w celu mozliwosci klikania
    });
  }

  // save new task
  void saveNewTask (){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Center(
            child: Text('TO DO'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}
