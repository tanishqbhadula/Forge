import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/today_sleep_schedule_row.dart';
import 'package:progresso/progresso.dart';

class SleepSchedule extends StatefulWidget {
  const SleepSchedule({super.key});

  @override
  State<SleepSchedule> createState() => _SleepScheduleState();
}

class _SleepScheduleState extends State<SleepSchedule> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  late DateTime _selectedDateAppBBar;

  List todaySleepArr = [
    {
      "name": "Bedtime",
      "image": "images/bed.png",
      "time": "01/06/2023 09:00 PM",
      "duration": "in 6hours 22minutes",
    },
    {
      "name": "Alarm",
      "image": "images/alarm.png",
      "time": "02/06/2023 05:10 AM",
      "duration": "in 14hours 30minutes",
    },
  ];

  List<int> showingTooltipOnSpots = [4];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Sleep Schedule',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(right: 16),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 14,
                  right: 14,
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  //height: media.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(media.width * 0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //const SizedBox(height: 15),
                          Text(
                            "Ideal Hours for Sleep",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "8hours 30minutes",
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: media.width * 0.08),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 95,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(25),
                              ),
                              textColor: Colors.white,
                              child: Text(
                                'Learn More',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "images/sleep_schedule.png",
                        width: media.width * 0.35,
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: media.width * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  "Your Schedule",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: media.width * 0.01),
              SizedBox(
                child: CalendarAgenda(
                  controller: _calendarAgendaControllerAppBar,
                  appbar: false,
                  selectedDayPosition: SelectedDayPosition.center,
                  weekDay: WeekDay.short,
                  backgroundColor: Colors.blue.shade700,
                  fullCalendar: false,
                  // fullCalendarScroll: FullCalendarScroll.horizontal,
                  // fullCalendarDay: WeekDay.short,
                  selectedDateColor: Colors.black,
                  dateColor: Colors.white,
                  locale: 'en',
                  initialDate: DateTime.now(),
                  calendarEventColor: Colors.blue,
                  firstDate: DateTime.now().subtract(const Duration(days: 140)),
                  lastDate: DateTime.now().add(const Duration(days: 60)),

                  onDateSelected: (date) {
                    setState(() {
                      _selectedDateAppBBar = date;
                    });
                  },
                ),
              ),
              SizedBox(height: media.width * 0.04),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: todaySleepArr.length,
                itemBuilder: (context, index) {
                  var sObj = todaySleepArr[index] as Map? ?? {};
                  return TodaySleepScheduleRow(sObj: sObj);
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  bottom: 8,
                  left: 14,
                  right: 14,
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  //height: media.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    // gradient: LinearGradient(
                    //   colors: [Colors.indigo.shade50, Colors.deepPurple.shade50,],
                    //   begin: AlignmentGeometry.topCenter,
                    //   end: AlignmentGeometry.bottomCenter,
                    // ),
                    borderRadius: BorderRadius.circular(media.width * 0.06),
                    // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You will get 7hours 45minutes\nfor tonight",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 2, bottom: 4, left: 5, right: 5),
                            child: Progresso(
                              progressStrokeWidth: 20,
                              backgroundStrokeWidth: 12,
                              progressColor: Colors.blue.shade400,
                              backgroundColor: Colors.white,
                              progress: 0.85,
                              progressStrokeCap: StrokeCap.round,
                              backgroundStrokeCap: StrokeCap.round,
                            ),
                          ),
                          Text(
                            "85%",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: InkWell(
      //   onTap: () {},
      //   child: Container(
      //     width: 55,
      //     height: 55,
      //     decoration: BoxDecoration(
      //       color: Colors.blue,
      //       borderRadius: BorderRadius.circular(media.width),
      //       boxShadow: const [
      //         BoxShadow(
      //           color: Colors.black12,
      //           blurRadius: 5,
      //           offset: Offset(0, 2),
      //         ),
      //       ],
      //     ),
      //     alignment: Alignment.center,
      //     child: Icon(Icons.add, size: 31.5, color: Colors.white),
      //   ),
      // ),
    );
  }
}
