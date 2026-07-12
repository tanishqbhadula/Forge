import 'package:flutter/material.dart';
import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';

class WorkoutSchedule extends StatefulWidget {
  const WorkoutSchedule({super.key});
  State<WorkoutSchedule> createState() {
    return _WorkoutScheduleState();
  }
}

class _WorkoutScheduleState extends State<WorkoutSchedule> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey.shade800,
          ),
        ),
        //elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_rounded, color: Colors.grey.shade800),
              ),
            ],
          ),
        ),
      ),
      // appBar: CalendarAgenda(
      //   backgroundColor: Colors.blue.shade800,
      //   controller: _calendarAgendaControllerAppBar,
      //   appbar: true,
      //   selectedDayPosition: SelectedDayPosition.right,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios_new,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {},
      //   ),
      //   weekDay: WeekDay.short,
      //   fullCalendarScroll: FullCalendarScroll.horizontal,
      //   fullCalendarDay: WeekDay.short,
      //   selectedDateColor: Colors.green.shade900,
      //   locale: 'en',
      //   initialDate: DateTime.now(),
      //   calendarEventColor: Colors.green,
      //   firstDate: DateTime.now().subtract(Duration(days: 140)),
      //   lastDate: DateTime.now().add(Duration(days: 60)),
      //   events: List.generate(
      //       100,
      //       (index) => DateTime.now()
      //           .subtract(Duration(days: index * random.nextInt(5)))),
      //   onDateSelected: (date) {
      //     setState(() {
      //       _selectedDateAppBBar = date;
      //     });
      //   },
      //   //calendarLogo: Icon(Icons.star),
      //   //selectedDayLogo: Icon(Icons.star),
      // ),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     _calendarAgendaControllerAppBar.goToDay(DateTime.now());
            //   },
            //   child: Text("Today"),
            // ),
            //Text('Selected date is $_selectedDateAppBBar'),
            SizedBox(
              height: 20.0,
            ),
            CalendarAgenda(
              backgroundColor: Colors.blue.shade900,
              controller: _calendarAgendaControllerNotAppBar,
              leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  "Your agenda for today is as follows",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // fullCalendar: false,
              locale: 'en',
              weekDay: WeekDay.short,
              fullCalendarDay: WeekDay.short,
              selectedDateColor: Colors.blue.shade900,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now().add(Duration(days: 4)),
              events: List.generate(
                  100,
                  (index) => DateTime.now()
                      .subtract(Duration(days: index * random.nextInt(5)))),
              onDateSelected: (date) {
                setState(() {
                  _selectedDateNotAppBBar = date;
                });
              },
              // calendarLogo: Image.network(
              //   'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
              //   scale: 5.0,
              // ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                _calendarAgendaControllerNotAppBar.goToDay(DateTime.now());
              },
              child: Text("Today", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
            ),
            //Text('Selected date is $_selectedDateNotAppBBar'),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}