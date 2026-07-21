import 'package:flutter/material.dart';
import 'package:forge/screens/meal_planner/meal_planner.dart';
import 'package:forge/screens/sleep/sleep_tracker.dart';
import 'package:forge/workout/workout_tracker.dart';

class Tracker extends StatefulWidget {
  const Tracker({super.key});
  State<Tracker> createState() {
    return _TrackerState();
  }
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        scrolledUnderElevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(media.width*0.06),
          )
        ),
        title: Text(
          'Tracker',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        // ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       padding: EdgeInsets.only(right: 16),
        //       width: 40,
        //       height: 40,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Colors.transparent,
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Icon(Icons.more_horiz_rounded, color: Colors.black),
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: media.width * 0.06),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  // WORKOUT TRACKER
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_) => WorkoutTracker())
                    );
                  },
                  child: Stack(
                    alignment: AlignmentGeometry.topRight,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            media.width * 0.05,
                          ),
                          color: Colors.blue.shade50,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 1),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Workout Tracker',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: media.width * 0.01),
                            Text(
                              'Track workouts, PRs, exercise history.',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: media.width * 0.09),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                width: media.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                    media.width * 0.1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Check',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10,
                        ),
                        child: Icon(
                          Icons.fitness_center_rounded,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                MaterialButton(
                  // MEAL TRACKER
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_) => MealPlanner())
                    );
                  },
                  child: Stack(
                    alignment: AlignmentGeometry.topRight,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            media.width * 0.05,
                          ),
                          color: Colors.deepPurple.shade50,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 1),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Meal Tracker',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: media.width * 0.01),
                            Text(
                              'Log meals, calories and macros.',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: media.width * 0.09),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                width: media.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(
                                    media.width * 0.1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Check',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10,
                        ),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                MaterialButton(
                  // SLEEP TRACKER
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (_) => SleepTracker())
                    );
                  },
                  child: Stack(
                    alignment: AlignmentGeometry.topRight,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            media.width * 0.05,
                          ),
                          color: Colors.green.shade50,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 1),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Sleep Tracker',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: media.width * 0.01),
                            Text(
                              'Monitor quality and hours of sleep.',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: media.width * 0.09),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                width: media.width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.green.shade700,
                                  borderRadius: BorderRadius.circular(
                                    media.width * 0.1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Check',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10,
                        ),
                        child: Icon(
                          Icons.hotel,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
