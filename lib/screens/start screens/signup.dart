import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/round_text_box.dart';
import 'package:forge/screens/start%20screens/completeprofile.dart';
import 'package:forge/screens/start%20screens/signin.dart';
import 'package:forge/services/signup_api_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  //PageController controller = PageController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final api = SignupApiService();
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
                  controller: firstnameController,
                ),
                SizedBox(height: media.width * 0.04),
                RoundTextBox(
                  hintText: 'Last name',
                  pre_icon: Icon(Icons.person),
                  controller: lastnameController,
                ),
                SizedBox(height: media.width * 0.04),
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
                      if(isChecked) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CompleteProfile())
                        );
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please agree to terms and conditions"),
                          ),
                        );
                      }
                    },
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
                        builder: (context) => SignIn(),
                      )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Login',
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
