import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/tab_button.dart';
import 'package:forge/screens/home/blank.dart';
import 'package:forge/screens/home/homepage.dart';
import 'package:forge/profile/profile.dart';
import 'package:forge/screens/tracker_screen/tracker.dart';
import 'package:forge/workout/workout_tracker.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});
  State<MainTab> createState() {
    return _MainTabState();
  }
}

class _MainTabState extends State<MainTab> {
  int selectTab = 0;
  Widget currentTab = const HomePage();
  final PageStorageBucket pageBucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              //color: Colors.blue,
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlue.shade300,
                  Colors.blue.shade400,
                  Colors.lightBlue.shade600,
                ],
              ),
              // boxShadow: const [
              //   BoxShadow(color: Colors.black12, blurRadius: 2, blurStyle: BlurStyle.outer),
              // ],
            ),
            child: Icon(Icons.search, color: Colors.white, size: 35),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          //color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(media.width*0.06),
            topRight: Radius.circular(media.width*0.06),
          ),
          child: BottomAppBar(
            //elevation: 2,
            //shadowColor: Colors.black12,
            color: Colors.white,
            child: Container(
              height: kToolbarHeight,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1. HOME
                  TabButton(
                    icon: Icons.home_filled,
                    selectIcon: Icon(Icons.home),
                    isActive: selectTab == 0,
                    onTap: () {
                      selectTab = 0;
                      currentTab = const HomePage();
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
                      currentTab = const Tracker();
                      if (mounted) {
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(width: 70),
                  const Spacer(),
                  TabButton(
                    icon: Icons.camera_alt,
                    selectIcon: Icon(Icons.camera_alt),
                    isActive: selectTab == 2,
                    onTap: () {
                      selectTab = 2;
                      currentTab = const Blank();
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
                      currentTab = const Profile();
                      if (mounted) {
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
