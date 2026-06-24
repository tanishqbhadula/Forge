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
  bool isChecked = false;

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
                  'Hey there',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                RoundTextBox(
                  hintText: 'First name',
                  pre_icon: Icon(Icons.person),
                ),
                SizedBox(height: media.width * 0.04),
                RoundTextBox(
                  hintText: 'Last name',
                  pre_icon: Icon(Icons.person),
                ),
                SizedBox(height: media.width * 0.04),
                RoundTextBox(
                  hintText: 'Email',
                  pre_icon: Icon(Icons.email),
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: media.width * 0.04),
                RoundTextBox(
                  hintText: 'Password',
                  pre_icon: Icon(Icons.lock_outline_rounded),
                  obscureText: true,
                  suf_icon: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.visibility_rounded),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      icon: isChecked
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Text(
                        'By continuing you agree to accept our private policy and terms of use',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.04),
                Container(
                  width: media.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue.shade200,
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                    textColor: Colors.white,
                    child: Text(
                      'Register',
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
      ),
    );
  }
}
