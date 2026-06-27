import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/tab_button.dart';
import 'package:forge/screens/home/homepage.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});
  State<MainTab> createState() {
    return _MainTabState();
  }
}

class _MainTabState extends State<MainTab> {
  int selectTab = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentTab = const HomePage();
    return Scaffold(
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
                color: Colors.blue,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,)
                ]
              ),
            child: Icon(Icons.search,color: Colors.white, size: 35, ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //surfaceTintColor: Colors.blueGrey,
        shape: CircularNotchedRectangle(),
        shadowColor: Colors.black,
        color: Colors.white,
        child: Container(
          height: kToolbarHeight,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              TabButton(
                icon: Icons.local_activity,
                selectIcon: Icon(Icons.local_activity),
                isActive: selectTab == 1,
                onTap: () {
                  selectTab = 1;
                  //currentTab = const SelectView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              const SizedBox(width: 70,),
              const Spacer(),
              TabButton(
                icon: Icons.camera_alt,
                selectIcon: Icon(Icons.camera_alt),
                isActive: selectTab == 2,
                onTap: () {
                  selectTab = 2;
                  //currentTab = const PhotoProgressView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              const Spacer(),
              TabButton(
                icon: Icons.person_2,
                selectIcon: Icon(Icons.person_2),
                isActive: selectTab == 3,
                onTap: () {
                  selectTab = 3;
                  //currentTab = const ProfileView();
                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
