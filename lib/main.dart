import 'package:flutter/material.dart';
import 'package:forge/screens/completeprofile.dart';
import 'package:forge/screens/goal.dart';
import 'package:forge/screens/homepage.dart';
import 'package:forge/screens/on_boarding.dart';
import 'package:forge/screens/signup.dart';
import 'package:forge/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Goal(),
      //home: Splash()
    );
  }
}
