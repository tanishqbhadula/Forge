import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/icon_title_next_row.dart';
import 'package:intl/intl.dart';

class AddSchedule extends StatefulWidget {
  final DateTime date;
  const AddSchedule({super.key, required this.date});

  @override
  State<AddSchedule> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddSchedule> {
  String dateToString(DateTime date, {String formatStr = "dd/MM/yyyy"}) {
    return DateFormat(formatStr).format(date);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black26,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.close_rounded, color: Colors.black),
          ),
        ),
        title: Text(
          "Schedule New Workout",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 5,
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.date_range),
                  const SizedBox(width: 8),
                  Text(
                    dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                "Select Time",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: media.width * 0.02),
              SizedBox(
                height: media.width * 0.35,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (newDate) {},
                  initialDateTime: DateTime.now(),
                  use24hFormat: false,
                  minuteInterval: 1,
                  mode: CupertinoDatePickerMode.time,
                ),
              ),
              SizedBox(height: media.width * 0.08),
              Text(
                "Workout Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: media.width * 0.03),
              IconTitleNextRow(
                icon: Icons.fitness_center_outlined,
                title: "Choose Workout",
                time: "Upperbody",
                color: Colors.grey.shade100,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              IconTitleNextRow(
                icon: Icons.fitness_center_outlined,
                title: "Difficulity",
                time: "Beginner",
                color: Colors.grey.shade100,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              IconTitleNextRow(
                icon: Icons.fitness_center_outlined,
                title: "Custom Repetitions",
                time: "10",
                color: Colors.grey.shade100,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              IconTitleNextRow(
                icon: Icons.fitness_center_outlined,
                title: "Custom Weights",
                time: "15",
                color: Colors.grey.shade100,
                onPressed: () {},
              ),
              Spacer(),
              Container(
                //margin: EdgeInsets.only(top:30),
                width: media.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue.shade500,
                ),
                child: MaterialButton(
                  onPressed: () {
                    //TODO (ADD WORKOUT TO LIST)
                    Navigator.pop(context);
                  },
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                  ),
                  textColor: Colors.white,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
