import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progresso/progresso.dart';

class ResultView extends StatefulWidget {
  final DateTime date1;
  final DateTime date2;
  const ResultView({super.key, required this.date1, required this.date2});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  int selectButton = 0;

  List imaArr = [
    {
      "title": "Front Facing",
      "month_1_image": "images/pp_1.png",
      "month_2_image": "images/pp_2.png",
    },
    {
      "title": "Back Facing",
      "month_1_image": "images/pp_3.png",
      "month_2_image": "images/pp_4.png",
    },
    {
      "title": "Left Facing",
      "month_1_image": "images/pp_5.png",
      "month_2_image": "images/pp_6.png",
    },
    {
      "title": "Right Facing",
      "month_1_image": "images/pp_7.png",
      "month_2_image": "images/pp_8.png",
    },
  ];

  List statArr = [
    {
      "title": "Lose Weight",
      "diff_per": "33",
      "month_1_per": "33%",
      "month_2_per": "67%",
    },
    {
      "title": "Height Increase",
      "diff_per": "88",
      "month_1_per": "88%",
      "month_2_per": "12%",
    },
    {
      "title": "Muscle Mass Increase",
      "diff_per": "57",
      "month_1_per": "57%",
      "month_2_per": "43%",
    },
    {
      "title": "Abs",
      "diff_per": "89",
      "month_1_per": "89%",
      "month_2_per": "11%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    String dateToString(DateTime date, {String formatStr = "dd/MM/yyyy"}) {
      return DateFormat(formatStr).format(date);
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 8,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text(
          'Comparison',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      alignment: selectButton == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width: (media.width * 0.5) - 40,
                        height: 40,
                        decoration: BoxDecoration(
                          //gradient: LinearGradient(colors: Colors.blue),
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 1),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectButton = 0;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Photo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectButton == 0
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectButton = 1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Statistic",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectButton == 1
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Photo Tab UI
              if (selectButton == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Average Progress",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "Good",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Progresso(
                          progressStrokeWidth: 20,
                          backgroundStrokeWidth: 12,
                          //progressColor: Colors.blue.shade400,
                          progressColor: Colors.blue.shade400,
                          backgroundColor: Colors.grey.shade300,
                          //backgroundColor: Colors.white,
                          progress: 0.62,
                          progressStrokeCap: StrokeCap.round,
                          backgroundStrokeCap: StrokeCap.round,
                        ),

                        Text(
                          "62%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateToString(widget.date1, formatStr: "MMMM"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          dateToString(widget.date2, formatStr: "MMMM"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imaArr.length,
                      itemBuilder: (context, index) {
                        var iObj = imaArr[index] as Map? ?? {};

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: media.width * 0.03),
                            Text(
                              iObj["title"].toString(),
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          iObj["month_1_image"].toString(),
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          iObj["month_2_image"].toString(),
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: media.width * 0.05),
                    Container(
                      //height: 30,
                      width: media.width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 2),
                        ],
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25),
                        ),
                        textColor: Colors.white,
                        child: Text(
                          'Back To Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),

              // Statistic Tab UI
              if (selectButton == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: media.width * 0.5,
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback:
                                (
                                  FlTouchEvent event,
                                  LineTouchResponse? response,
                                ) {
                                  if (response == null ||
                                      response.lineBarSpots == null) {
                                    return;
                                  }
                                },
                            mouseCursorResolver:
                                (
                                  FlTouchEvent event,
                                  LineTouchResponse? response,
                                ) {
                                  if (response == null ||
                                      response.lineBarSpots == null) {
                                    return SystemMouseCursors.basic;
                                  }
                                  return SystemMouseCursors.click;
                                },
                            getTouchedSpotIndicator:
                                (
                                  LineChartBarData barData,
                                  List<int> spotIndexes,
                                ) {
                                  return spotIndexes.map((index) {
                                    return TouchedSpotIndicatorData(
                                      FlLine(color: Colors.transparent),
                                      FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                                FlDotCirclePainter(
                                                  radius: 3,
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                  strokeColor:
                                                      Colors.deepPurple,
                                                ),
                                      ),
                                    );
                                  }).toList();
                                },
                            touchTooltipData: LineTouchTooltipData(
                              //tooltipBgColor: Colors.secondaryColor1,
                              //tooltipRoundedRadius: 20,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
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
                                color: Colors.grey.shade100,
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
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dateToString(widget.date1, formatStr: "MMMM"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          dateToString(widget.date2, formatStr: "MMMM"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: statArr.length,
                      itemBuilder: (context, index) {
                        var iObj = statArr[index] as Map? ?? {};

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              iObj["title"].toString(),
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 25,
                                  child: Text(
                                    iObj["month_1_per"].toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Progresso(
                                      progressStrokeWidth: 16,
                                      backgroundStrokeWidth: 16,
                                      progressColor: Colors.blue.shade400,
                                      backgroundColor: Colors.grey.shade300,
                                      progress:
                                          (double.tryParse(
                                                iObj["diff_per"].toString(),
                                              ) ??
                                              0.0) /
                                          100.0,
                                      progressStrokeCap: StrokeCap.round,
                                      backgroundStrokeCap: StrokeCap.round,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 25,
                                  child: Text(
                                    iObj["month_2_per"].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: media.width * 0.09),
                    Container(
                      //height: 30,
                      width: media.width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25),
                        ),
                        textColor: Colors.white,
                        child: Text(
                          'Back To Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      //tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
  ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    //gradient: LinearGradient(colors: Colors.primaryG),
    color: Colors.blue,
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 35),
      FlSpot(2, 70),
      FlSpot(3, 40),
      FlSpot(4, 80),
      FlSpot(5, 25),
      FlSpot(6, 70),
      FlSpot(7, 35),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    gradient: LinearGradient(
      colors: [
        Colors.indigo.withValues(alpha: 0.5),
        Colors.deepPurple.withValues(alpha: 0.5),
      ],
    ),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 80),
      FlSpot(2, 50),
      FlSpot(3, 90),
      FlSpot(4, 40),
      FlSpot(5, 80),
      FlSpot(6, 35),
      FlSpot(7, 60),
    ],
  );

  SideTitles get rightTitles => SideTitles(
    getTitlesWidget: rightTitleWidgets,
    showTitles: true,
    interval: 20,
    reservedSize: 40,
  );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: TextStyle(color: Colors.grey, fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(color: Colors.grey, fontSize: 12);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Jan', style: style);
        break;
      case 2:
        text = Text('Feb', style: style);
        break;
      case 3:
        text = Text('Mar', style: style);
        break;
      case 4:
        text = Text('Apr', style: style);
        break;
      case 5:
        text = Text('May', style: style);
        break;
      case 6:
        text = Text('Jun', style: style);
        break;
      case 7:
        text = Text('Jul', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 10, child: text);
  }
}
