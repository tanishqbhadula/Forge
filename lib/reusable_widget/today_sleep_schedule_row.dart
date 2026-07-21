import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodaySleepScheduleRow extends StatefulWidget {
  final Map sObj;
  const TodaySleepScheduleRow({super.key, required this.sObj});

  @override
  State<TodaySleepScheduleRow> createState() => _TodaySleepScheduleRowState();
}

class _TodaySleepScheduleRowState extends State<TodaySleepScheduleRow> {
  bool positive = false;
  bool _bedtimeEnabled = true;
  bool _alarmEnabled = true;

  String getStringDateToOtherFormate(
    String date, {
    String inFormatStr = "dd/MM/yyyy hh:mm aa",
    String outFormatStr = "h:mm aa",
  }) {
    final dt = DateFormat(inFormatStr).parse(date);
    return DateFormat(outFormatStr).format(dt);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: EdgeInsets.only(top: 2, bottom: 4, left: 10, right: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          //const SizedBox(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(media.width * 0.05),
            child: Image.asset(
              widget.sObj["image"].toString(),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: media.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.sObj["name"].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      " (${getStringDateToOtherFormate(widget.sObj["time"].toString())})",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Text(
                  widget.sObj["duration"].toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: media.width*0.085,
                width: media.width*0.07,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_rounded),
                ),
              ),
              SizedBox(
                height: 45,
                child: Switch(
                  padding: EdgeInsets.only(right: 20),
                  activeThumbColor: Colors.white,
                  activeTrackColor: Colors.blue,
                  inactiveThumbColor: Colors.grey.shade700,
                  inactiveTrackColor: Colors.grey.shade100,
                  value: _bedtimeEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _bedtimeEnabled = !_bedtimeEnabled;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
