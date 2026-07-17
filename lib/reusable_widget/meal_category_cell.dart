import 'package:flutter/material.dart';

class MealCategoryCell extends StatelessWidget {
  final Map cObj;
  final int index;
  const MealCategoryCell({super.key, required this.index, required this.cObj});

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      width: 80,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: isEven
        //       ? [Colors.blue.shade100, Colors.blue.shade200]
        //       : [Colors.deepPurple.shade300, Colors.deepPurple],
        // ),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17.5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17.5),
              ),
              child: Image.asset(
                cObj["image"].toString(),
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              cObj["name"],
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
