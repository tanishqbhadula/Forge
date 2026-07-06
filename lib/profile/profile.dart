import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  State<Profile> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  var _notificationsEnabled = true;
  var _darkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(25),
                      child: Image.asset(
                        'images/pic_4.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(width: media.width * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Lose Fat Program',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const Spacer(),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25),
                        ),
                        textColor: Colors.white,
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.02),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              media.width * 0.04,
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 1),
                            ],
                          ), // HEIGHT
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                '180cm',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Height',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: media.width * 0.04),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              media.width * 0.04,
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 1),
                            ],
                          ), // WEIGHT
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                '65kg',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Weight',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: media.width * 0.04),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              media.width * 0.04,
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 1),
                            ],
                          ), // AGE
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                '22yo',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Age',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: media.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(media.width * 0.04),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: media.width*0.03,),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Personal Data',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                        SizedBox(height: media.width*0.015,),
                        Row(
                          children: [
                            Icon(Icons.ballot_rounded, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Achievement',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                        SizedBox(height: media.width*0.015,),
                        Row(
                          children: [
                            Icon(Icons.timer, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Activity history',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                        SizedBox(height: media.width*0.015,),
                        Row(
                          children: [
                            Icon(Icons.bar_chart_outlined, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Workout progress',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: media.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(media.width * 0.04),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: media.width*0.03,),
                        Row(
                          children: [
                            Icon(Icons.notifications, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Pop-up notifications',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Switch(
                              activeThumbColor: Colors.white,
                              activeTrackColor: Colors.blue,
                              inactiveThumbColor: Colors.grey.shade700,
                              inactiveTrackColor: Colors.grey.shade100,
                              value: _notificationsEnabled, 
                              onChanged: (bool value) {
                                setState(() {
                                  _notificationsEnabled = !_notificationsEnabled;
                                });
                              } 
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: media.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(media.width * 0.04),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Theme',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: media.width*0.03,),
                        Row(
                          children: [
                            Icon(Icons.dark_mode, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Switch(
                              activeThumbColor: Colors.white,
                              activeTrackColor: Colors.blue,
                              inactiveThumbColor: Colors.grey.shade700,
                              inactiveTrackColor: Colors.grey.shade100,
                              value: _darkModeEnabled, 
                              onChanged: (bool value) {
                                setState(() {
                                  _darkModeEnabled = !_darkModeEnabled;
                                });
                              } 
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: media.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(media.width * 0.04),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Others',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: media.width*0.03,),
                        Row(
                          children: [
                            Icon(Icons.mail, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Contact us',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                        SizedBox(height: media.width*0.03,),
                        Row(
                          children: [
                            Icon(Icons.policy, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Private policy',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                        SizedBox(height: media.width*0.03,),
                        Row(
                          children: [
                            Icon(Icons.settings, color: Colors.grey.shade900,),
                            SizedBox(width: media.width*0.02,),
                            Expanded(
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            ),
                            Icon(Icons.navigate_next_rounded, color: Colors.black,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width*0.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
