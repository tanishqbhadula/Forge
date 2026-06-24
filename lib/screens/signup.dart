import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/round_text_box.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Welcome'),
        // titleTextStyle: TextStyle(
        //   fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black
        // ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hey There',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'Create an Account',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: media.width*0.05,),
                RoundTextBox(hintText: 'First name', icon: Icon(Icons.person)),
                SizedBox(height: media.width*0.02,),
                RoundTextBox(hintText: 'Last name', icon: Icon(Icons.person)),
                SizedBox(height: media.width*0.02,),
                RoundTextBox(hintText: 'Email', icon: Icon(Icons.email), inputType: TextInputType.emailAddress,),
              ],
            ),
          ),
        ),
      )
    );
  }
}