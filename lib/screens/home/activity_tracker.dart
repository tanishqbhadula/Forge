import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/latest_activity_row.dart';
import 'package:http/http.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:progresso/progresso.dart';

class ActivityTracker extends StatefulWidget {
  const ActivityTracker({super.key});
  @override
  State<ActivityTracker> createState() {
    return _ActivityTracker();
  }
}

class _ActivityTracker extends State<ActivityTracker> {
  List latestActivityArr = [
    {
      "image": "images/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago",
    },
    {
      "image": "images/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago",
    },
  ];
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        title: Text(
          'Activity Tracker',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODAYS TARGETS BOX
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    //color: Colors.blue.shade50.withValues(alpha: 0.75),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade50.withValues(alpha: 1), Colors.deepPurple.shade50.withValues(alpha: 1)],
                      begin: AlignmentGeometry.bottomLeft,
                      end: AlignmentGeometry.topRight
                    ),
                    borderRadius: BorderRadius.circular(media.width * 0.1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Target",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade800,
                              borderRadius: BorderRadius.circular(
                                media.width * 0.05,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: media.width * 0.03),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  media.width * 0.03,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: media.width * 0.13,
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset(
                                      'images/water.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '5L',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                      Text(
                                        'Water Intake',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: media.width * 0.03),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  media.width * 0.03,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: media.width * 0.13,
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset(
                                      'images/foot.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '10000',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                      Text(
                                        'Footsteps',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
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
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.07),
                // ACTIVITY PROGRESS GRAPH DAYS
                Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Activity Progress',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: media.width * 0.08,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                items: ["Weekly", "Monthly"]
                                    .map(
                                      (name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {},
                                icon: Icon(
                                  Icons.expand_more_rounded,
                                  color: Colors.white,
                                ),
                                hint: Text(
                                  'Weekly',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: media.width * 0.03),
                      // GRAPH
                      Container(
                        height: media.width * 0.5,
                        padding: EdgeInsets.only(
                          //left: 4,
                          //right: 4,
                          top: 16,
                          bottom: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),
                        child: BarChart(
                          BarChartData(
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                //tooltipBgColor: Colors.grey,
                                tooltipHorizontalAlignment:
                                    FLHorizontalAlignment.right,
                                tooltipMargin: 10,
                                getTooltipItem:
                                    (group, groupIndex, rod, rodIndex) {
                                      String weekDay;
                                      switch (group.x) {
                                        case 0:
                                          weekDay = 'Monday';
                                          break;
                                        case 1:
                                          weekDay = 'Tuesday';
                                          break;
                                        case 2:
                                          weekDay = 'Wednesday';
                                          break;
                                        case 3:
                                          weekDay = 'Thursday';
                                          break;
                                        case 4:
                                          weekDay = 'Friday';
                                          break;
                                        case 5:
                                          weekDay = 'Saturday';
                                          break;
                                        case 6:
                                          weekDay = 'Sunday';
                                          break;
                                        default:
                                          throw Error();
                                      }
                                      return BarTooltipItem(
                                        '$weekDay\n',
                                        const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: (rod.toY - 1).toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                              ),
                              touchCallback:
                                  (FlTouchEvent event, barTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          barTouchResponse == null ||
                                          barTouchResponse.spot == null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = barTouchResponse
                                          .spot!
                                          .touchedBarGroupIndex;
                                    });
                                  },
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: getTitles,
                                  reservedSize: 38,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: showingGroups(),
                            gridData: FlGridData(show: false),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Activity',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text(
                          'see more',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //LATEST ACTIVITY LIST
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: latestActivityArr.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var wObj = latestActivityArr[index] as Map? ?? {};
                    return LatestActivityRow(wObj: wObj);
                  },
                ),
                SizedBox(height: media.width * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(meta: meta, space: 16, child: text);
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 16, [
          Colors.blue.shade300,
          Colors.blue.shade500,
        ], isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 17, [
          Colors.deepPurple.shade500,
          Colors.deepPurple.shade200,
        ], isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 15, [
          Colors.blue.shade300,
          Colors.blue.shade500,
        ], isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 17, [
          Colors.deepPurple.shade500,
          Colors.deepPurple.shade200,
        ], isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 15, [
          Colors.blue.shade300,
          Colors.blue.shade500,
        ], isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 12.5, [
          Colors.deepPurple.shade500,
          Colors.deepPurple.shade200,
        ], isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 13, [
          Colors.blue.shade300,
          Colors.blue.shade500,
        ], isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartGroupData makeGroupData(
    int x,
    double y,
    List<Color> barColor, {
    bool isTouched = false,

    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          gradient: LinearGradient(
            colors: barColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.green)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.grey.shade100,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
