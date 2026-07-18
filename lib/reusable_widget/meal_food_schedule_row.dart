import 'package:flutter/material.dart';

class MealFoodScheduleRow extends StatelessWidget {
  final Map mObj;
  final int index;
  const MealFoodScheduleRow({
    super.key,
    required this.mObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 12, left: 2, right: 2),
      padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(media.width*0.05),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? Colors.blue.shade50
                    : Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(media.width*0.1),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                mObj["image"].toString(),
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mObj["name"].toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade900,
                  ),
                ),
                Text(
                  mObj["time"].toString(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.navigate_next_rounded, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
