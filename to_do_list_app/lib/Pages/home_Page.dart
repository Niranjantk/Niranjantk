import 'package:flutter/material.dart';
import 'package:to_do_list_app/Pages/utils/to_do_list.dart';

class HomePageToDo extends StatelessWidget {
  HomePageToDo({super.key});

  List todolist = [
    ["to learn flutter", false],
    ["drink water", true],
    ["to learn flutter", false],
    ["drink water", true],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text('To-Do-List'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, index) {
          return ToDoList(taskname: todolist[index][0],);
        },
      ),
    );
  }
}
