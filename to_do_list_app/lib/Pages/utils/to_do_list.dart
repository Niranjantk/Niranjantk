import 'package:flutter/material.dart';
class ToDoList extends StatelessWidget {
  const ToDoList({super.key,
  required this.taskname,
  required this.taskcomplected,
  required this.onChanged});
  final String taskname;
  final bool taskcomplected;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Checkbox(
                    value: taskcomplected, 
                    onChanged: onChanged),
                  Text(
                    taskname,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          );
    
  }
}