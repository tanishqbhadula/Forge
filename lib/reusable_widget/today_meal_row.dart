import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayMealRow extends StatelessWidget {
  final Map mObj;
  const TodayMealRow({super.key, required this.mObj});
  String getDayTitle(String date) {
    final dt = DateFormat("dd/MM/yyyy hh:mm aa").parse(date);
    return DateFormat("EEEE").format(dt);
  }

  String getStringDateToOtherFormate(
    String date, {
    String inFormatStr = "dd/MM/yyyy hh:mm aa",
    required String outFormatStr,
  }) {
    final dt = DateFormat(inFormatStr).parse(date);
    return DateFormat(outFormatStr).format(dt);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      padding: EdgeInsets.only(top: 10, bottom: 10, left:12, right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(media.width * 0.05),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(media.width*0.1),
            child: Image.asset(
              mObj["image"],
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
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
                  "${getDayTitle(mObj["time"].toString())} | ${getStringDateToOtherFormate(mObj["time"].toString(), outFormatStr: "h:mm aa")}",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
    );
  }
}
