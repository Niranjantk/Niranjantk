import 'package:flutter/material.dart';
import 'package:pocket_planner/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/abcd.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    left: 16, // Adjust left padding as needed
                    bottom: 10, // Adjust bottom padding for the text
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 40, // Adjust bottom padding as needed
            right: 16, // Adjust right padding as needed
            child: ElevatedButton(
  onPressed: () {
    // Your button action here
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctxt)=>const SignInPage()));
  },
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Continue',style: TextStyle(color: Colors.blue),),
      SizedBox(width: 8), // Optional spacing between text and icon
      Icon(Icons.arrow_forward,color: Colors.blue,), // Arrow icon
    ],
  ),
),

          ),
        ],
      ),
    );
  }
}
