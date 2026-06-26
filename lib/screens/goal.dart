import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  const Goal({super.key});
  @override
  State<Goal> createState() {
    return _GoalState();
  }
}

class _GoalState extends State<Goal> {
  String? _selectedGoal;
  Widget _goalCard(String title, IconData icon) {
    final bool isSelected = (_selectedGoal == title);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGoal = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: (isSelected) ? Colors.blue.shade500 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: (isSelected) ? Colors.blue : Colors.grey.shade100,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.white : Colors.blue,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.white),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                width: media.width,
                child: Column(
                  children: [
                    SizedBox(height: media.width * 0.05),
                    Text(
                      'What is your Goal?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 30,
                      ),
                      child: Text(
                        'it will help us choose the best program for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: media.width * 0.05),
                    _goalCard("Build Muscle", Icons.fitness_center),
                    _goalCard("Build Strength", Icons.sports_gymnastics),
                    _goalCard("Lose Fat", Icons.local_fire_department),
                    _goalCard("Lean & Tone", Icons.self_improvement),
                    _goalCard("Custom", Icons.tune),
                    const Spacer(),
                    SizedBox(height: media.width * 0.05),
                    Container(
                      //margin: EdgeInsets.only(top:30),
                      width: media.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue.shade500,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (_selectedGoal == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a goal'),
                              ),
                            );
                          }
                        },
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25),
                        ),
                        textColor: Colors.white,
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
