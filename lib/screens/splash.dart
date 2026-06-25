import 'package:flutter/material.dart';
import 'package:forge/screens/on_boarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateToOnBoaring();
  }
  @override
  Widget build(BuildContext context) {
    //var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        color: Colors.blue.shade50,
        child: Stack( 
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FORGE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'forge your fitness',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    
                    //fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<void> navigateToOnBoaring() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => OnBoarding(),
      ),
    );
  }
}
