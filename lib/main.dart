import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forge/firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:forge/screens/main_tab/floating_bottom_nav_bar.dart';
import 'package:forge/screens/start%20screens/completeprofile.dart';
import 'package:forge/screens/start%20screens/goal.dart';
import 'package:forge/screens/start%20screens/signin.dart';
import 'package:forge/screens/start%20screens/signup.dart';
import 'package:forge/screens/start%20screens/splash.dart';

Future<void> main() async {
  //print('Main start');
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Splash(),
      home: FloatingBottomNavBar(),
    );
  }
}
