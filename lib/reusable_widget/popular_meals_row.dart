import 'package:flutter/material.dart';

class PopularMealRow extends StatelessWidget {
  final Map mObj;
  const PopularMealRow({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
      padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(media.width * 0.05),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(media.width*0.1),
            child: Image.asset(
              mObj["image"].toString(),
              width: 45,
              height: 45,
              fit: BoxFit.contain,
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
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${mObj["size"]} | ${mObj["time"]} | ${mObj["kcal"]}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next_rounded)),
        ],
      ),
    );
  }
}
