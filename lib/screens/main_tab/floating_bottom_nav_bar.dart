import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/tab_button.dart';

class FloatingBottomNavBar extends StatefulWidget {
  const FloatingBottomNavBar({super.key});
  @override
  State<FloatingBottomNavBar> createState() {
    return _FloatingBottomNavBarState();
  }
}

class _FloatingBottomNavBarState extends State<FloatingBottomNavBar> {
  int selectTab = 0;
  //Widget currentTab = const HomePage();
  final PageStorageBucket pageBucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: SizedBox(
      //   width: 70,
      //   height: 70,
      //   child: InkWell(
      //     onTap: () {},
      //     child: Container(
      //       width: 65,
      //       height: 65,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(35),
      //         //color: Colors.blue,
      //         gradient: LinearGradient(
      //           colors: [
      //             Colors.lightBlue.shade300,
      //             Colors.blue.shade400,
      //             Colors.lightBlue.shade600,
      //           ],
      //         ),
      //         // boxShadow: const [
      //         //   BoxShadow(color: Colors.black12, blurRadius: 2, blurStyle: BlurStyle.outer),
      //         // ],
      //       ),
      //       child: Icon(Icons.fitness_center_outlined, color: Colors.white, size: 35),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Container(
          height: media.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: media.width,
                height: media.width*0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(media.width*0.1),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //const Spacer(),
                    // 1. HOME
                    TabButton(
                      icon: Icons.home_filled,
                      selectIcon: Icon(Icons.home),
                      isActive: selectTab == 0,
                      onTap: () {
                        selectTab = 0;
                        //currentTab = const HomePage();
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    const Spacer(),
                    // 2. TRACKER
                    TabButton(
                      icon: Icons.timer,
                      selectIcon: Icon(Icons.local_activity),
                      isActive: selectTab == 1,
                      onTap: () {
                        selectTab = 1;
                        //currentTab = const Tracker();
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    //const SizedBox(width: 70),
                    const Spacer(),
                    // 3. chat bot heph
                    TabButton(
                      icon: Icons.fitness_center_outlined,
                      selectIcon: Icon(Icons.fitness_center_outlined),
                      isActive: selectTab == 2,
                      onTap: () {
                        selectTab = 2;
                        //currentTab = const ProgressPhoto();
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    const Spacer(),
                    // 4. PROGRESS PHOTO
                    TabButton(
                      icon: Icons.camera_alt,
                      selectIcon: Icon(Icons.camera_alt),
                      isActive: selectTab == 3,
                      onTap: () {
                        selectTab = 3;
                        //currentTab = const ProgressPhoto();
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    const Spacer(),
                    TabButton(
                      // 5. PROFILE
                      icon: Icons.person_2,
                      selectIcon: Icon(Icons.person_2),
                      isActive: selectTab == 4,
                      onTap: () {
                        selectTab = 4;
                        //currentTab = const Profile();
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    //const Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}