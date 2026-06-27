import 'package:flutter/material.dart';
import 'package:forge/screens/home/homepage.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  State<Welcome> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: media.width*0.05,),
              Image.asset(
                'images/welcome.png',
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                'Welcome Onboard',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'you are all set now to reach your goal with us!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: media.width * 0.05),
              const Spacer(),
              Container(
                //margin: EdgeInsets.only(top:30),
                width: media.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade500,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                  ),
                  textColor: Colors.white,
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
