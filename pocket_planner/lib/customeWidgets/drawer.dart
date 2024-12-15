import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 14, 42, 65),
                ),
                child: const CupertinoSearchTextField(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 9, 47, 78)),
                )),
          )
        ],
      ),
    );
  }
}
