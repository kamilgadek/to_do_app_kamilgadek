import 'package:flutter/material.dart';
import 'package:to_do_app_koko/util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of to do tasks to my ListView builder
  List toDoList = [
    ['Make tutorial', false],
    ['Do exercise', false],
  ];

  // method for check box was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1]; // tworze to jako przeciwne w celu mozliwosci klikania
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
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
          return ToDoTile(
          taskName: toDoList[index][0], 
          taskCompleted: toDoList[index][1], 
          onChanged:(value) => checkBoxChanged(value, index), 
          );
        },
      )
    );
  }
}
