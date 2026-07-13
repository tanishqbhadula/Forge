import 'package:flutter/material.dart';
import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:forge/workout/add_schedule.dart';
import 'package:intl/intl.dart';

class WorkoutSchedule extends StatefulWidget {
  const WorkoutSchedule({super.key});
  State<WorkoutSchedule> createState() {
    return _WorkoutScheduleState();
  }
}

class _WorkoutScheduleState extends State<WorkoutSchedule> {
  final CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  final CalendarAgendaController _calendarAgendaController =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;
  DateTime dateToStartDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  DateTime stringToDate(
    String date, {
    String formatStr = "dd/MM/yyyy hh:mm aa",
  }) {
    return DateFormat(formatStr).parse(date);
  }

  String getTime(int minutes) {
    final hour = minutes ~/ 60;
    final minute = minutes % 60;
    final date = DateTime(2025, 1, 1, hour, minute);
    return DateFormat("h:mm a").format(date);
  }

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

  Random random = new Random();
  List eventArr = [
    {"name": "Ab Workout", "start_time": "25/05/2023 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "25/05/2023 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "25/05/2023 03:00 PM"},
    {"name": "Ab Workout", "start_time": "26/05/2023 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "26/05/2023 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "26/05/2023 03:00 PM"},
    {"name": "Ab Workout", "start_time": "27/05/2023 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "27/05/2023 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "27/05/2023 03:00 PM"},
  ];

  List selectDayEventArr = [];

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    setDayEventWorkoutList();
  }

  void setDayEventWorkoutList() {
    var date = dateToStartDate(_selectedDateAppBBar);
    selectDayEventArr = eventArr
        .map((wObj) {
          return {
            "name": wObj["name"],
            "start_time": wObj["start_time"],
            "date": stringToDate(
              wObj["start_time"].toString(),
              formatStr: "dd/MM/yyyy hh:mm aa",
            ),
          };
        })
        .where((wObj) {
          return dateToStartDate(wObj["date"] as DateTime) == date;
        })
        .toList();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'Workout Schedule',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 10,
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
              padding: EdgeInsets.all(8),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: media.width*0.03,),
          CalendarAgenda(
            backgroundColor: Colors.blue.shade800,
            calendarBackground: Colors.blue.shade800,
            controller: _calendarAgendaController,
            fullCalendar: true,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            calendarEventColor: Colors.blue.shade900,
            calendarEventSelectedColor: Colors.white,
            selectedDayPosition: SelectedDayPosition.center,
            dateColor: Colors.white,
            selectedDateColor: Colors.blue.shade800,
            locale: 'en',
            weekDay: WeekDay.short,
            fullCalendarDay: WeekDay.short,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 140)),
            lastDate: DateTime.now().add(Duration(days: 4)),
            events: List.generate(
              100,
              (index) => DateTime.now().subtract(
                Duration(days: index * random.nextInt(5)),
              ),
            ),
            onDateSelected: (date) {
              setState(() {
                _selectedDateNotAppBBar = date;
              });
            },
          ),
          SizedBox(height: media.width*0.03,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: media.width * 1.5,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var timelineDataWidth = (media.width * 1.5) - (80 + 40);
                    var availWidth = (media.width * 1.2) - (80 + 40);
                    var slotArr = selectDayEventArr.where((wObj) {
                      return (wObj["date"] as DateTime).hour == index;
                    }).toList();

                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text(
                              getTime(index * 60),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          if (slotArr.isNotEmpty)
                            Expanded(
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: slotArr.map((sObj) {
                                  var min = (sObj["date"] as DateTime).minute;
                                  //(0 to 2)
                                  var pos = (min / 60) * 2 - 1;
                                  return Align(
                                    alignment: Alignment(pos, 0),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              contentPadding: EdgeInsets.zero,
                                              content: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 20,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets.all(
                                                                  8,
                                                                ),
                                                            height: 40,
                                                            width: 40,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                            child: Image.asset(
                                                              "assets/img/closed_btn.png",
                                                              width: 15,
                                                              height: 15,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Workout Schedule",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets.all(
                                                                  8,
                                                                ),
                                                            height: 40,
                                                            width: 40,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                            child: Image.asset(
                                                              "assets/img/more_btn.png",
                                                              width: 15,
                                                              height: 15,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 15),
                                                    Text(
                                                      sObj["name"].toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          //"assets/img/time_workout.png",
                                                          height: 20,
                                                          width: 20,
                                                          child: Icon(
                                                            Icons
                                                                .watch_later_outlined,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          "${getDayTitle(sObj["start_time"].toString())}|${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    const SizedBox(height: 15),
                                                    Container(
                                                      width: media.width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              25,
                                                            ),
                                                        color: Colors
                                                            .blue
                                                            .shade500,
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {},
                                                        height: 50,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadiusGeometry.circular(
                                                                25,
                                                              ),
                                                        ),
                                                        textColor: Colors.white,
                                                        child: Text(
                                                          'Confirm',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 35,
                                        width: availWidth * 0.5,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue,
                                              Colors.deepPurple,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            17.5,
                                          ),
                                        ),
                                        child: Text(
                                          "${sObj["name"].toString()}, ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey.withValues(alpha: 0.2),
                      height: 1,
                    );
                  },
                  itemCount: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSchedule(
                    date: _selectedDateAppBBar,
              )
            )
          );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 8)
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
