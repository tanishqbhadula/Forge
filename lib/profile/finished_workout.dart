import 'package:flutter/material.dart';

class FinishedWorkout extends StatefulWidget {
  const FinishedWorkout({super.key});
  State<FinishedWorkout> createState() {
    return _FinishedWorkout();
  }
}

class _FinishedWorkout extends State<FinishedWorkout> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/img/complete_workout.png",
                height: media.width * 0.8,
                fit: BoxFit.fitHeight,
              ),

              const SizedBox(height: 20),

              Text(
                "Congratulations, You Have Finished Your Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

              const SizedBox(height: 8),

              Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

              const Spacer(),

              //  RoundButton(
              //     title: "Back To Home",
              //     onPressed: () {
              //       Navigator.pop(context);
              //     }),

              //    const SizedBox(
              //   height: 8,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
