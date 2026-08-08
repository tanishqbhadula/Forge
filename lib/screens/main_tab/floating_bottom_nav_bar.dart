import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/tab_button.dart';

class FloatingBottomNavBar extends StatelessWidget {
  final int selectTab;
  final Function(int) onTabSelected;

  const FloatingBottomNavBar({
    super.key,
    required this.selectTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      //height: media.width * 0.15,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(media.width * 0.1),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // 1. HOME
          TabButton(
            icon: Icons.home_filled,
            selectIcon: const Icon(Icons.home),
            isActive: selectTab == 0,
            onTap: () => onTabSelected(0),
          ),

          const Spacer(),

          // 2. TRACKER
          TabButton(
            icon: Icons.timer,
            selectIcon: const Icon(Icons.local_activity),
            isActive: selectTab == 1,
            onTap: () => onTabSelected(1),
          ),

          const Spacer(),

          // 3. HEPH
          TabButton(
            icon: Icons.fitness_center_outlined,
            selectIcon: const Icon(Icons.fitness_center_outlined),
            isActive: selectTab == 2,
            onTap: () => onTabSelected(2),
          ),

          const Spacer(),

          // 4. PROGRESS
          TabButton(
            icon: Icons.camera_alt,
            selectIcon: const Icon(Icons.camera_alt),
            isActive: selectTab == 3,
            onTap: () => onTabSelected(3),
          ),

          const Spacer(),

          // 5. PROFILE
          TabButton(
            icon: Icons.person_2,
            selectIcon: const Icon(Icons.person_2),
            isActive: selectTab == 4,
            onTap: () => onTabSelected(4),
          ),
        ],
      ),
    );
  }
}