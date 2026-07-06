import 'dart:math';

import 'package:flutter/material.dart';

class FinishedWorkout extends StatefulWidget {
  const FinishedWorkout({super.key});
  State<FinishedWorkout> createState() {
    return _FinishedWorkout();
  }
}

class _FinishedWorkout extends State<FinishedWorkout> {
  final List<Map<String, dynamic>> workoutQuotes = [
    {
      "id": 1,
      "quote":
          "Great work! Every rep brought you one step closer to your goal.",
      "author": "Forge",
    },
    {
      "id": 2,
      "quote": "Consistency beats intensity. See you at the next workout!",
      "author": "Forge",
    },
    {
      "id": 3,
      "quote": "Your future self will thank you for today's effort.",
      "author": "Unknown",
    },
    {
      "id": 4,
      "quote": "One workout at a time. One victory at a time.",
      "author": "Forge",
    },
    {
      "id": 5,
      "quote": "Progress isn't always visible, but it's always happening.",
      "author": "Unknown",
    },
    {
      "id": 6,
      "quote": "You showed up. You pushed yourself. That's what matters.",
      "author": "Forge",
    },
    {
      "id": 7,
      "quote": "Small improvements every day lead to big results over time.",
      "author": "Unknown",
    },
    {
      "id": 8,
      "quote": "The hardest part was starting—you conquered it today.",
      "author": "Forge",
    },
    {
      "id": 9,
      "quote": "Discipline built this workout. Keep the momentum going.",
      "author": "Forge",
    },
    {
      "id": 10,
      "quote":
          "Workout complete. Recover well, eat smart, and come back stronger!",
      "author": "Forge",
    },
    {
      "id": 11,
      "quote":
          "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
      "author": "Jack Lalanne",
    },
  ];

  final random = Random();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final selectedQuote = workoutQuotes[random.nextInt(workoutQuotes.length)];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: media.width * 0.08),
              Image.asset(
                'images/complete_workout.png',
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
                selectedQuote['quote'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

              const SizedBox(height: 8),

              Text(
                "-${selectedQuote['author']}",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

              const Spacer(),

              Container(
                width: media.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                  textColor: Colors.white,
                  child: Text(
                    'Back to home',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: media.width * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
