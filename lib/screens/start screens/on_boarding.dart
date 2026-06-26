import 'package:flutter/material.dart';
import 'package:forge/screens/start%20screens/signup.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  State<OnBoarding> createState() {
    return _OnBoardingState();
  }
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return SizedBox(
                width: media.width,
                height: media.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/onboarding_1.png',
                      width: media.width,
                      fit: BoxFit.fitWidth
                    ),
                    SizedBox(
                      height: media.width*0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Achieve Your Goals',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Dont worry if you have trouble determining and achiving your goals, Join us and accomplish your goals with a plan',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              );
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignUp())
          );
        },
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.white,
        elevation: 5,
        child: Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}