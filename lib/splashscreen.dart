import 'dart:async';
import 'package:advbasics/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay to display the splash screen
    Timer(Duration(seconds: 2), () {
      // Navigate to the main screen (replace 'MainScreen()' with your actual main screen widget)
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image.jpeg'),
      ),
    );
  }
}
