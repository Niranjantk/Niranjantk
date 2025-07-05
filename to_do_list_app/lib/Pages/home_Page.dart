import 'package:flutter/material.dart';
import 'package:to_do_list_app/Pages/utils/to_do_list.dart';

class HomePageToDo extends StatefulWidget {
  HomePageToDo({super.key});

  @override
  State<HomePageToDo> createState() => _HomePageToDoState();
}

class _HomePageToDoState extends State<HomePageToDo> {
  List todolist = [
    ["to learn flutter", false],
    ["drink water", true],
    ["to learn flutter", false],
    ["drink water", true],
  ];

  void checkboxchanged(int index){
    setState(() {
      todolist[index][1]=!todolist[index][1];
    });
  }

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
          return ToDoList(
            taskname: todolist[index][0],
            taskcomplected: todolist[index][1],
            onChanged: (value)=>checkboxchanged(index),
          );
        },
      ),
    );
  }
}
