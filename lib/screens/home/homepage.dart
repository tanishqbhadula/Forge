import 'package:flutter/material.dart';
//import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
//import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:wiggly_loaders/wiggly_loaders.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // HEART RATE GRAPH
  List<int> showingTooltipOnSpots = [21];
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
    lineChartBarData1_1,
    lineChartBarData1_2,
  ];
  // WORKOUT PROGRESS GRAPH LINE 1
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    //gradient: LinearGradient(colors: [Colors.blue.shade300, Colors.deepPurple.shade300]),
    color: Colors.blue.shade600.withValues(alpha: 0.6),
    barWidth: 2.5,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
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
  // WORKOUT PROGRESS GRAPH LINE 2
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    // gradient: LinearGradient(
    //   colors: [Colors.cyan, Colors.blueGrey],
    // ),
    color: Colors.deepPurple.shade300.withValues(alpha: 0.9),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
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
        return const SizedBox.shrink();
    }
    return Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12));
  }

  // WORKOUT PROGRESS GRAPH DAYS TILES X-AXIS
  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontSize: 12);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 3:
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
        showingIndicators: showingTooltipOnSpots,
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
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_rounded),
            ),

            floating: false,
            pinned: true,
            //elevation: 25,
            shadowColor: Colors.black,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: SingleChildScrollView(
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        // main outside column
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // top welcome text
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome back,',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: media.width * 0.05),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications),
                                iconSize: media.width * 0.09,
                              ),
                            ],
                          ),
                          SizedBox(height: media.width * 0.01),
                          Container(
                            // bmi box
                            //padding: EdgeInsets.all(16),
                            //height: media.width * 0.4,
                            width: media.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade300,
                                  Colors.deepPurple.shade400,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                media.width * 0.1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'images/bg_dots.png',
                                  fit: BoxFit.fitHeight,
                                  width: double.maxFinite,
                                  height: media.width * 0.4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 25,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'BMI (Body Mass Index)',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            'You have a normal weight',
                                            style: TextStyle(
                                              color: Colors.white.withValues(
                                                alpha: 0.7,
                                              ),
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: media.width * 0.05),
                                          SizedBox(
                                            width: 120,
                                            height: 35,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.pink.shade400,
                                                    Colors.deepPurple.shade400,
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25),
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
                                                  'View More',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: media.width * 0.06),
                          Container(
                            width: media.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(
                                media.width * 0.07,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today's Target",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(25),
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
                          SizedBox(height: media.width * 0.06),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              'Activty Status',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: media.width * 0.02),
                          // main outer col of activity status
                          Column(
                            children: [
                              Container(
                                // heart rate
                                width: media.width,
                                height: media.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50.withValues(
                                    alpha: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    media.width * 0.1,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    // LOAD GRAPH
                                    SizedBox(
                                      child: LineChart(
                                        LineChartData(
                                          showingTooltipIndicators:
                                              showingTooltipOnSpots.map((
                                                index,
                                              ) {
                                                return ShowingTooltipIndicators(
                                                  [
                                                    LineBarSpot(
                                                      tooltipsOnBar,
                                                      lineBarsData.indexOf(
                                                        tooltipsOnBar,
                                                      ),
                                                      tooltipsOnBar
                                                          .spots[index],
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                          lineTouchData: LineTouchData(
                                            enabled: true,
                                            handleBuiltInTouches: false,
                                            touchCallback:
                                                (
                                                  FlTouchEvent event,
                                                  LineTouchResponse? response,
                                                ) {
                                                  if (response == null ||
                                                      response.lineBarSpots ==
                                                          null) {
                                                    return;
                                                  }
                                                  if (event is FlTapUpEvent) {
                                                    final spotIndex = response
                                                        .lineBarSpots!
                                                        .first
                                                        .spotIndex;
                                                    showingTooltipOnSpots
                                                        .clear();
                                                    setState(() {
                                                      showingTooltipOnSpots.add(
                                                        spotIndex,
                                                      );
                                                    });
                                                  }
                                                },
                                            mouseCursorResolver:
                                                (
                                                  FlTouchEvent event,
                                                  LineTouchResponse? response,
                                                ) {
                                                  if (response == null ||
                                                      response.lineBarSpots ==
                                                          null) {
                                                    return SystemMouseCursors
                                                        .basic;
                                                  }
                                                  return SystemMouseCursors
                                                      .click;
                                                },
                                            getTouchedSpotIndicator:
                                                (
                                                  LineChartBarData barData,
                                                  List<int> spotIndexes,
                                                ) {
                                                  return spotIndexes.map((
                                                    index,
                                                  ) {
                                                    return TouchedSpotIndicatorData(
                                                      FlLine(color: Colors.red),
                                                      FlDotData(
                                                        show: true,
                                                        getDotPainter:
                                                            (
                                                              spot,
                                                              percent,
                                                              barData,
                                                              index,
                                                            ) =>
                                                                FlDotCirclePainter(
                                                                  radius: 3,
                                                                  color: Colors
                                                                      .white,
                                                                  strokeWidth:
                                                                      3,
                                                                  strokeColor:
                                                                      Colors
                                                                          .blue,
                                                                ),
                                                      ),
                                                    );
                                                  }).toList();
                                                },
                                            touchTooltipData: LineTouchTooltipData(
                                              tooltipBorderRadius:
                                                  BorderRadius.circular(2),
                                              //tooltipBgColor: TColor.secondaryColor1,
                                              //tooltipRoundedRadius: 20,
                                              getTooltipItems:
                                                  (
                                                    List<LineBarSpot>
                                                    lineBarsSpot,
                                                  ) {
                                                    return lineBarsSpot.map((
                                                      lineBarSpot,
                                                    ) {
                                                      return LineTooltipItem(
                                                        "${lineBarSpot.x.toInt()} mins ago",
                                                        const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      );
                                                    }).toList();
                                                  },
                                            ),
                                          ),
                                          lineBarsData: lineBarsData,
                                          minY: 0,
                                          maxY: 130,
                                          titlesData: FlTitlesData(show: false),
                                          gridData: FlGridData(show: false),
                                          borderData: FlBorderData(
                                            show: true,
                                            border: Border.all(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Heart Rate',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.5,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                '78 BPM',
                                                style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: media.width * 0.05,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: media.width * 0.04),
                              // water intake, sleep, cals grey box
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100.withValues(
                                    alpha: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    media.width * 0.1,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          media.width * 0.05,
                                        ),
                                      ),
                                      child: Column(
                                        // water intake col
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0,
                                            ),
                                            child: Row(
                                              // top text row
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Water intake',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: media.width * 0.02,
                                                ),
                                                Text(
                                                  '4 Liters',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue.shade900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: media.width * 0.9,
                                            //child: Expanded(
                                            child: WigglyLinearLoader(
                                              progress: 0.75,
                                              height: media.width * 0.065,
                                              wiggleCount: 1,
                                              progressEndColor:
                                                  Colors.blue.shade400,
                                              progressColor:
                                                  Colors.deepPurple.shade300,
                                              trackColor: Colors.blue.shade50
                                                  .withValues(alpha: 0.6),
                                              borderRadius: 14,
                                            ),
                                            //),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: media.width * 0.03),
                                    // sleep and cals row
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: media.height * 0.21,
                                            // sleep
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    media.width * 0.05,
                                                  ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sleep',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: media.width * 0.01,
                                                ),
                                                Row(
                                                  // sleep time
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '8h 20m',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors
                                                            .blue
                                                            .shade900,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Image.asset(
                                                  'images/sleep_graph_colored.png',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: media.width * 0.03),
                                        Expanded(
                                          child: Container(
                                            height: media.height * 0.21,
                                            // cals
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    media.width * 0.05,
                                                  ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cals',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: media.width * 0.01,
                                                ),
                                                Text(
                                                  '2360 kCals',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue.shade900,
                                                  ),
                                                ),
                                                Container(
                                                  height: media.height * 0.1,
                                                  alignment: Alignment.center,
                                                  child:
                                                      CircularProgressIndicator(
                                                        value: 0.87,
                                                        color: Colors.blue,
                                                      ),
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
                            ],
                          ),
                          SizedBox(height: media.width * 0.06),
                          // WORKOUT PROGRESS AND DURATION BUTTON
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Workout Progress',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: media.width * 0.08,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
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
                          ),
                          SizedBox(height: media.width * 0.03),
                          // Container(
                          //   height: media.width*0.2,
                          //   width: media.width,
                          //   padding: EdgeInsets.all(8),
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey.shade100,
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Text('graph'),
                          // ),

                          // WORKOUT PROGRESS GRAPH
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            height: media.width * 0.5,
                            width: double.maxFinite,
                            child: LineChart(
                              LineChartData(
                                showingTooltipIndicators: showingTooltipOnSpots
                                    .map((index) {
                                      return ShowingTooltipIndicators([
                                        LineBarSpot(
                                          tooltipsOnBar,
                                          lineBarsData.indexOf(tooltipsOnBar),
                                          tooltipsOnBar.spots[index],
                                        ),
                                      ]);
                                    })
                                    .toList(),
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
                                        if (event is FlTapUpEvent) {
                                          final spotIndex = response
                                              .lineBarSpots!
                                              .first
                                              .spotIndex;
                                          showingTooltipOnSpots.clear();
                                          setState(() {
                                            showingTooltipOnSpots.add(
                                              spotIndex,
                                            );
                                          });
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
                                                  (
                                                    spot,
                                                    percent,
                                                    barData,
                                                    index,
                                                  ) => FlDotCirclePainter(
                                                    radius: 3,
                                                    color: Colors.white,
                                                    strokeWidth: 3,
                                                    strokeColor: Colors
                                                        .deepPurple
                                                        .shade300,
                                                  ),
                                            ),
                                          );
                                        }).toList();
                                      },
                                  touchTooltipData: LineTouchTooltipData(
                                    //tooltipBgColor: TColor.secondaryColor1,
                                    //tooltipRoundedRadius: 20,
                                    getTooltipItems:
                                        (List<LineBarSpot> lineBarsSpot) {
                                          return lineBarsSpot.map((
                                            lineBarSpot,
                                          ) {
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
                                  bottomTitles: AxisTitles(
                                    sideTitles: bottomTitles,
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: rightTitles,
                                  ),
                                ),
                                gridData: FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  horizontalInterval: 25,
                                  drawVerticalLine: false,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color: Colors.grey.withValues(
                                        alpha: 0.15,
                                      ),
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
                          //SizedBox(height: media.width * 0.05),
                          SizedBox(height: media.width * 0.1),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
