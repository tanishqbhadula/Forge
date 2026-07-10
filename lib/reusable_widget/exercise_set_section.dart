import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/exercise_row.dart';

class ExercisesSetSection extends StatelessWidget {
  final Map sObj;
  final Function(Map obj) onPressed;
  const ExercisesSetSection({
    super.key,
    required this.sObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var exercisesArr = sObj["set"] as List? ?? [];
    var media = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: media.width*0.04),
        Text(
          sObj["name"].toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: media.width*0.01),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: exercisesArr.length,
          itemBuilder: (context, index) {
            var eObj = exercisesArr[index] as Map? ?? {};
            return ExercisesRow(
              eObj: eObj,
              onPressed: () {
                onPressed(eObj);
              },
            );
          },
        ),
      ],
    );
  }
}
