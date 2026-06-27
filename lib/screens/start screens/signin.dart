import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/round_text_box.dart';
import 'package:forge/screens/home/homepage.dart';
import 'package:forge/screens/start%20screens/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  State<SignIn> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: media.width,
            //height: media.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hey there',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                RoundTextBox(
                  hintText: 'Email',
                  pre_icon: Icon(Icons.email),
                  inputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(height: media.width * 0.04),
                RoundTextBox(
                  hintText: 'Password',
                  controller: passwordController,
                  pre_icon: Icon(Icons.lock_outline_rounded),
                  obscureText: true,
                  suf_icon: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.visibility_rounded),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                //const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:6.0),
                      child: Expanded(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
                //const Spacer(),
                SizedBox(height: media.width * 0.6),
                Container(
                  //margin: EdgeInsets.only(top:30),
                  width: media.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue.shade500,
                  ),
                  child: MaterialButton(
                    // onPressed: () async { // API CALL
                    //   await api.registerUser({
                    //     "first_name" : firstnameController.text,
                    //     "last_name" : lastnameController.text,
                    //     "email" :  emailController.text,
                    //     "password" : passwordController.text,
                    //   });
                    // },
                    onPressed: () {
                      //validate password
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        )
                      );
                    },
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                    textColor: Colors.white,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.width*0.05,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.withValues(alpha:0.5),
                      )
                    ),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey.withValues(alpha:0.5),
                      )
                    ),
                  ],
                ),
                SizedBox(height: media.width*0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.withValues(alpha: 0.5),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(25),
                          child: Image.asset(
                            'images/google logo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: media.width*0.04,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.withValues(alpha: 0.5),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(25),
                          child: Image.asset(
                            'images/Facebook logo.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width*0.02,),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account yet? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
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