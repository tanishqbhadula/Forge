import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpcomingWorkoutRow extends StatefulWidget {
  final Map wObj;
  const UpcomingWorkoutRow({super.key, required this.wObj});
  State<UpcomingWorkoutRow> createState() {
    return _UpcomingWorkoutRowState();
  }
}

class _UpcomingWorkoutRowState extends State<UpcomingWorkoutRow> {
  bool positive = true;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
        borderRadius: BorderRadius.circular(media.width * 0.05),
      ),
      child: Row(
        children: [
          Image.asset(widget.wObj['image'].toString(), height: 50, width: 50, fit: BoxFit.cover,),
          SizedBox(width: media.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.wObj['title'].toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade900,
                  ),
                ),
                Text(
                  widget.wObj['time'].toString(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.grey.shade700,
            inactiveTrackColor: Colors.grey.shade100,
            value: positive,
            onChanged: (bool value) {
              setState(() {
                positive = !positive;
              });
            },
          ),
        ],
      ),
    );
  }
}
