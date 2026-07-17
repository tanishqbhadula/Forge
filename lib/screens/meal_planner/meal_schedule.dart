import 'package:flutter/material.dart';
import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:forge/reusable_widget/meal_food_schedule_row.dart';
import 'package:forge/reusable_widget/nutritions_row.dart';
import 'package:intl/intl.dart';

class MealSchedule extends StatefulWidget {
  const MealSchedule({super.key});
  State<MealSchedule> createState() {
    return _MealScheduleState();
  }
}

class _MealScheduleState extends State<MealSchedule> {
  final CalendarAgendaController _calendarAgendaController =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
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
    {"name": "Ab Workout", "start_time": "13/07/2026 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "06/07/2026 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "06/07/2026 03:00 PM"},
    {"name": "Ab Workout", "start_time": "14/07/2026 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "08/07/2026 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "08/07/2026 03:00 PM"},
    {"name": "Ab Workout", "start_time": "07/07/2026 07:30 AM"},
    {"name": "Upperbody Workout", "start_time": "15/07/2026 09:00 AM"},
    {"name": "Lowerbody Workout", "start_time": "15/07/2026 03:00 PM"},
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

  List breakfastArr = [
    {
      "name": "Honey Pancake",
      "time": "07:00am",
      "image": "images/honey_pan.png",
    },
    {"name": "Coffee", "time": "07:30am", "image": "images/coffee.png"},
  ];

  List lunchArr = [
    {"name": "Chicken Steak", "time": "01:00pm", "image": "images/chicken.png"},
    {"name": "Milk", "time": "01:20pm", "image": "images/glass-of-milk 1.png"},
  ];

  List snacksArr = [
    {"name": "Orange", "time": "04:30pm", "image": "images/orange.png"},
    {"name": "Apple Pie", "time": "04:40pm", "image": "images/apple_pie.png"},
  ];

  List dinnerArr = [
    {"name": "Salad", "time": "07:10pm", "image": "images/salad.png"},
    {"name": "Oatmeal", "time": "08:10pm", "image": "images/oatmeal.png"},
  ];

  List nutritionArr = [
    {
      "title": "Calories",
      "image": "images/burn.png",
      "unit_name": "kCal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Proteins",
      "image": "images/proteins.png",
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "images/egg.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
    {
      "title": "Carbs",
      "image": "images/carbo.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: SizedBox(
        width: 58,
        height: 58,
        child: InkWell(
          onTap: () {},
          child: Container(
            //width: 60,
            //height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.blue,
            ),
            child: Icon(Icons.add, color: Colors.white, size: 35,),
          ),
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Meal Schedule',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  _selectedDateAppBBar = date;
                  setDayEventWorkoutList();
                });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: media.width * 0.04),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Macros",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: nutritionArr.length,
                        itemBuilder: (context, index) {
                          var nObj = nutritionArr[index] as Map? ?? {};
                          return NutritionRow(nObj: nObj, index: index);
                        },
                      ),
                    ),

                    SizedBox(height: media.width * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Breakfast",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${breakfastArr.length} Items | 230 calories",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: breakfastArr.length,
                      itemBuilder: (context, index) {
                        var mObj = breakfastArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(mObj: mObj, index: index);
                      },
                    ),

                    //SizedBox(height: media.width * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Lunch",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${lunchArr.length} Items | 750 calories",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lunchArr.length,
                      itemBuilder: (context, index) {
                        var mObj = lunchArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(mObj: mObj, index: index);
                      },
                    ),

                    //SizedBox(height: media.width * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Snacks",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${snacksArr.length} Items | 220 calories",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snacksArr.length,
                      itemBuilder: (context, index) {
                        var mObj = snacksArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(mObj: mObj, index: index);
                      },
                    ),

                    //SizedBox(height: media.width * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Dinner",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${dinnerArr.length} Items | 570 calories",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dinnerArr.length,
                      itemBuilder: (context, index) {
                        var mObj = dinnerArr[index] as Map? ?? {};
                        return MealFoodScheduleRow(mObj: mObj, index: index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
