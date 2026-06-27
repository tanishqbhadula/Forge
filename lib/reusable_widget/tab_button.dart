import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final Icon selectIcon; // not used now
  final VoidCallback onTap;
  final bool isActive;

  const TabButton({
    super.key,
    required this.icon,
    required this.selectIcon, // not used now 
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive? Colors.blue : Colors.black, size: 30,),
          //SizedBox(height: isActive ? 12 : 8),
          //SizedBox(height: 3,),
          if (isActive)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.blue),
            ),
        ],
      ),
    );
  }
}
