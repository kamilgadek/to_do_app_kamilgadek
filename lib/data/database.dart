import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];


  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app, po to zeby user wiedział co ta apka w ogóle robi
  void createInitialData(){
    toDoList = [
      ['Make tutorail', false],
      ['Do exercise', false],
    ];
  }
  //load the data from the database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }
  //update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }

}