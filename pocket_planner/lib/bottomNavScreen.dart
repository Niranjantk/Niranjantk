import 'package:flutter/material.dart';
import 'package:pocket_planner/addExpenceScreen.dart';
import 'package:pocket_planner/chartScreen.dart';
import 'package:pocket_planner/expenceList.dart';
import 'package:pocket_planner/homeScreen.dart';
import 'package:pocket_planner/profileScreen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
     HomeScreen(),
   const ProgressChartScreen(),
     AddExpenceScreen(),
    ExpensesListScreen(),
     ProfileScreen(),
  ];

  // Function to handle the bottom navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color for the Scaffold (main screen)
      // backgroundColor: Colors.blueGrey[50], // optional for whole screen

      body: _screens[_selectedIndex], // Display the selected screen
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
             backgroundColor:  Color.fromARGB(255, 10, 43, 69)
          ),
          BottomNavigationBarItem(
             backgroundColor:  Color.fromARGB(255, 10, 43, 69),
            icon: Icon(Icons.show_chart),
            label: 'Graphs',
          ),
          BottomNavigationBarItem(
            backgroundColor:  Color.fromARGB(255, 10, 43, 69),
            icon: Icon(Icons.add),
            
            label: 'Add',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
             backgroundColor:  Color.fromARGB(255, 10, 43, 69)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor:  Color.fromARGB(255, 10, 43, 69)
          ),
        ],
        // Customizing the BottomNavigationBar colors
        selectedItemColor:Colors.cyan, // Color for the selected item
        unselectedItemColor: Colors.white, // Color for the unselected items
        // Background color for the BottomNavigationBar
        elevation: 10, // Shadow elevation
      ),
    );
  }
}

// Screen 1: Home Screen



// Helper function to create a screen with a title
Widget _screenContainer(String title) {
  return Center(
    child: Container(
      color: Colors.blueGrey[50],
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
