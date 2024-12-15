
import 'package:flutter/material.dart';
import 'package:pocket_planner/addwalletScreen.dart';
import 'package:pocket_planner/bottomNavScreen.dart';
import 'package:pocket_planner/homeScreen.dart';
import 'package:pocket_planner/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: BottomNavScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

