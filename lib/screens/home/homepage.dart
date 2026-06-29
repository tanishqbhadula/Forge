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
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
            pinned: false,
            //elevation: 25,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
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
                          Column(
                            // main outer col of activity status
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
                                    Image.asset(
                                      'images/graph-removebg-preview.png',
                                      fit: BoxFit.fill,
                                      width: double.maxFinite,
                                      //height: media.width * 0.3,
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
                                        // main water col
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
                                            child: Expanded(
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: media.width * 0.03),
                                    Row(
                                      // sleep and cals row
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
                                                  height: media.height*0.1,
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
                                // DROP DOWN BUTTON
                                //DropdownButton(items: , onChanged: onChanged)
                              ],
                            ),
                          ),
                          // GRAPH 
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
