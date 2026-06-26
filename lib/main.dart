import 'package:flutter/material.dart';
import 'package:forge/screens/start%20screens/completeprofile.dart';
import 'package:forge/screens/start%20screens/goal.dart';
import 'package:forge/screens/homepage.dart';
import 'package:forge/screens/start%20screens/on_boarding.dart';
import 'package:forge/screens/start%20screens/signup.dart';
import 'package:forge/screens/start%20screens/splash.dart';
import 'package:forge/screens/start%20screens/welome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Welcome(),
      home: Splash()
    );
  }
}
