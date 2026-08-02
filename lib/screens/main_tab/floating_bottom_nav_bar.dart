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
                    // PROGRESS PHOTO
                    TabButton(
                      icon: Icons.camera_alt,
                      selectIcon: Icon(Icons.camera_alt),
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
                    TabButton(
                      // PROFILE
                      icon: Icons.person_2,
                      selectIcon: Icon(Icons.person_2),
                      isActive: selectTab == 3,
                      onTap: () {
                        selectTab = 3;
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