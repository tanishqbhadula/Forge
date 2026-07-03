import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:forge/screens/home/activity_tracker.dart';
import 'package:forge/screens/home/homepage.dart';
import 'package:forge/screens/home/notification.dart';
import 'package:forge/screens/home/profile.dart';
import 'package:forge/screens/main_tab/maintab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(
  SystemUiMode.manual,
  overlays: SystemUiOverlay.values,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SignIn(),
      home: MainTab()
    );
  }
}
