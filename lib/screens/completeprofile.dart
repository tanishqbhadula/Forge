import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forge/reusable_widget/round_text_box.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});
  State<CompleteProfile> createState() {
    return _CompleteProfileState();
  }
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  'images/complete_profile.png',
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width*0.05,
                ),
                Text(
                  'Lets complete your profile',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  'it will help us know more about you',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: media.width*0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
                    child: Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: ["Male","Female","Others"].map(
                            (name) => DropdownMenuItem(
                              value: name,
                              child: Text(
                                name,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ).toList(), 
                          onChanged: (value) {},
                          isExpanded: true,
                          icon: Icon(Icons.people),
                          hint: Text(
                            'Choose Gender', 
                            style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width*0.04,
                ),
                RoundTextBox(hintText: 'Date of Birth', pre_icon: Icon(Icons.date_range)),
                SizedBox(
                  height: media.width*0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: 
                        RoundTextBox(hintText: 'Body Weight', pre_icon: Icon(Icons.monitor_weight_outlined)),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: 45, height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'kg',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width*0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: 
                        RoundTextBox(hintText: 'Height', pre_icon: Icon(Icons.height)),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: 45, height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width*0.06,
                ),
                Container(
                  //margin: EdgeInsets.only(top:30),
                  width: media.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue.shade500,
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                    textColor: Colors.white,
                    child: Text(
                      'Next',
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
          )
        ),
      ),
    );
  }
}