import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:forge/reusable_widget/find_eat_cell.dart';
import 'package:forge/reusable_widget/today_meal_row.dart';
import 'package:forge/reusable_widget/today_sleep_schedule_row.dart';
import 'package:forge/screens/meal_planner/meal_food_details.dart';
import 'package:forge/screens/meal_planner/meal_schedule.dart';
import 'package:forge/screens/sleep/sleep_schedule.dart';

class SleepTracker extends StatefulWidget {
  const SleepTracker({super.key});
  State<SleepTracker> createState() {
    return _SleepTrackerState();
  }
}

class _SleepTrackerState extends State<SleepTracker> {
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

  List<FlSpot> get allSpots => const [
    FlSpot(0, 20),
    FlSpot(1, 25),
    FlSpot(2, 40),
    FlSpot(3, 50),
    FlSpot(4, 35),
    FlSpot(5, 40),
    FlSpot(6, 30),
    FlSpot(7, 20),
    FlSpot(8, 25),
    FlSpot(9, 40),
    FlSpot(10, 50),
    FlSpot(11, 35),
    FlSpot(12, 50),
    FlSpot(13, 60),
    FlSpot(14, 40),
    FlSpot(15, 50),
    FlSpot(16, 20),
    FlSpot(17, 25),
    FlSpot(18, 40),
    FlSpot(19, 50),
    FlSpot(20, 35),
    FlSpot(21, 80),
    FlSpot(22, 30),
    FlSpot(23, 20),
    FlSpot(24, 25),
    FlSpot(25, 40),
    FlSpot(26, 50),
    FlSpot(27, 35),
    FlSpot(28, 50),
    FlSpot(29, 60),
    FlSpot(30, 40),
  ];

  List<LineChartBarData> get lineBarsData1 => [
    //lineChartBarData1_1,
    lineChartBarData1_2,
  ];
  // LineChartBarData get lineChartBarData1_1 => LineChartBarData(
  //   isCurved: true,
  //   //gradient: LinearGradient(colors: [Colors.blue.shade300, Colors.deepPurple.shade300]),
  //   color: Colors.blue.shade600.withValues(alpha: 0.6),
  //   barWidth: 2.5,
  //   isStrokeCapRound: true,
  //   dotData: const FlDotData(show: false),
  //   belowBarData: BarAreaData(show: false),
  //   spots: const [
  //     FlSpot(1, 35),
  //     FlSpot(2, 70),
  //     FlSpot(3, 40),
  //     FlSpot(4, 80),
  //     FlSpot(5, 25),
  //     FlSpot(6, 70),
  //     FlSpot(7, 35),
  //   ],
  // );
  // WORKOUT PROGRESS GRAPH LINE
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: Colors.blue.shade600,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      gradient: LinearGradient(
        colors: [
          Colors.blue.shade500.withValues(alpha: 0.5),
          Colors.blue.shade200.withValues(alpha: 0.5),
          Colors.white.withValues(alpha: 0.6),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      //color: Colors.blue.shad100,
    ),

    spots: const [
      FlSpot(1, 20),
      FlSpot(2, 80),
      FlSpot(3, 90),
      FlSpot(4, 70),
      FlSpot(5, 50),
      FlSpot(6, 75),
      FlSpot(7, 60),
      FlSpot(8, 80),
      FlSpot(9, 10),
    ],
  );
  // WORKOUT PROGRESS GRAPH PERCENTAGE TILES Y-AXIS
  SideTitles get rightTitles => SideTitles(
    showTitles: true,
    interval: 20,
    reservedSize: 40,
    getTitlesWidget: rightTitleWidgets,
  );
  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0h';
        break;
      case 20:
        text = '2h';
        break;
      case 40:
        text = '4h';
        break;
      case 60:
        text = '6h';
        break;
      case 80:
        text = '8h';
        break;
      case 100:
        text = '10h';
        break;
      default:
        return const SizedBox.shrink();
    }
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black45,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // WORKOUT PROGRESS GRAPH DAYS TILES X-AXIS
  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black45,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
    Widget text;
    switch (value.toInt()) {
      case 1 || 8:
        text = const Text('Sun', style: style);
        break;
      case 2 || 9:
        text = const Text('Mon', style: style);
        break;
      case 3 || 10:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('Thu', style: style);
        break;
      case 6:
        text = const Text('Fri', style: style);
        break;
      case 7:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('');
    }
    return SideTitleWidget(meta: meta, space: 10, child: text);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final lineBarsData = [
      LineChartBarData(
        //showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 1.8,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.deepPurple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          //color: Colors.blue.shad100,
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(colors: [Colors.blue, Colors.deepPurple]),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Sleep Tracker',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(height: media.width * 0.04),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Meal Nutritions',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w700,
                //           color: Colors.black,
                //         ),
                //       ),
                //       Container(
                //         height: media.width * 0.08,
                //         padding: const EdgeInsets.symmetric(horizontal: 8),
                //         decoration: BoxDecoration(
                //           color: Colors.blue,
                //           borderRadius: BorderRadius.circular(15),
                //         ),
                //         child: DropdownButtonHideUnderline(
                //           child: DropdownButton(
                //             items: ["Weekly", "Monthly"]
                //                 .map(
                //                   (name) => DropdownMenuItem(
                //                     value: name,
                //                     child: Text(
                //                       name,
                //                       style: TextStyle(
                //                         color: Colors.grey,
                //                         fontSize: 14,
                //                       ),
                //                     ),
                //                   ),
                //                 )
                //                 .toList(),
                //             onChanged: (value) {},
                //             icon: Icon(
                //               Icons.expand_more_rounded,
                //               color: Colors.white,
                //             ),
                //             hint: Text(
                //               'Weekly',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontSize: 12,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: media.width * 0.06),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 5,
                    top: 5,
                    bottom: 5,
                  ),
                  height: media.width * 0.5,
                  width: media.width,
                  alignment: AlignmentGeometry.center,
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchCallback:
                            (FlTouchEvent event, LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                            },
                        mouseCursorResolver:
                            (FlTouchEvent event, LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(color: Colors.transparent),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                              radius: 3,
                                              color: Colors.deepPurple,
                                              strokeWidth: 3,
                                              strokeColor:
                                                  Colors.deepPurple.shade300,
                                            ),
                                  ),
                                );
                              }).toList();
                            },
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                            return lineBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                "${lineBarSpot.x.toInt()} mins ago",
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      lineBarsData: lineBarsData1,
                      minY: -0.5,
                      maxY: 110,
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                        bottomTitles: AxisTitles(sideTitles: bottomTitles),
                        rightTitles: AxisTitles(sideTitles: rightTitles),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 25,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey.withValues(alpha: 0.15),
                            strokeWidth: 2,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  width: media.width,
                  //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    //color: Colors.blue.shade100.withValues(alpha: 0.2),
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade400, Colors.indigo.shade600],
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(media.width * 0.07),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                        child: Text(
                          'Last Night Sleep',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 2,
                          bottom: 4,
                        ),
                        child: Text(
                          '8h 10m',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: media.width,
                        child: Image.asset('images/SleepGraph.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  width: media.width,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    //color: Colors.blue.shade100.withValues(alpha: 0.2),
                    color: Colors.grey.shade100.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(media.width * 0.07),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Sleep Schedule",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SleepSchedule(),
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(25),
                          ),
                          textColor: Colors.white,
                          child: Text(
                            'Check',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Schedule",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todaySleepArr.length,
                  itemBuilder: (context, index) {
                    var sObj = todaySleepArr[index] as Map? ?? {};
                    return TodaySleepScheduleRow(sObj: sObj);
                  },
                ),
                SizedBox(height: media.width * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
