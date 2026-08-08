import 'package:flutter/material.dart';

import 'package:forge/screens/chatbot_heph/chatbot_screen.dart';
import 'package:forge/screens/home/homepage.dart';
import 'package:forge/screens/main_tab/floating_bottom_nav_bar.dart';
import 'package:forge/screens/profile/profile.dart';
import 'package:forge/screens/progress/progress_photo.dart';
import 'package:forge/screens/tracker_screen/tracker.dart';


class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  // --------------------------------------------------
  // SELECTED TAB
  // --------------------------------------------------

  int selectTab = 0;

  // --------------------------------------------------
  // PAGE STORAGE
  // --------------------------------------------------

  final PageStorageBucket pageBucket = PageStorageBucket();

  // --------------------------------------------------
  // MAIN PAGES
  // --------------------------------------------------

  final List<Widget> pages = const [
    HomePage(),
    Tracker(),
    ProgressPhoto(),
    Profile(),
  ];

  // --------------------------------------------------
  // NAVIGATION
  // --------------------------------------------------

  void onTabSelected(int index) {
    // HEPH
    // Center button opens chatbot instead of changing tab.
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChatbotScreen(),
        ),
      );

      return;
    }

    // Because HEPH occupies index 2 visually,
    // Progress and Profile need to map to the
    // corresponding page indexes.
    int pageIndex;

    if (index > 2) {
      pageIndex = index - 1;
    } else {
      pageIndex = index;
    }

    if (selectTab == pageIndex) {
      return;
    }

    setState(() {
      selectTab = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          PageStorage(
            bucket: pageBucket,
            child: IndexedStack(
              index: selectTab,
              children: pages,
            ),
          ),

          Positioned(
            left: 18,
            right: 18,
            bottom: 30,
            child: FloatingBottomNavBar(
              selectTab: selectTab >= 2
                  ? selectTab + 1
                  : selectTab,
              onTabSelected: onTabSelected,
            ),
          ),
        ],
      ),
    );
  }
}