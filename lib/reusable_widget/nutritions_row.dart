import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';

class NutritionRow extends StatelessWidget {
  final Map nObj;
  final int index;
  const NutritionRow({super.key, required this.index, required this.nObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var val = double.tryParse(nObj["value"].toString()) ?? 1;
    var maxVal = double.tryParse(nObj["max_value"].toString()) ?? 1;
    var isEven = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                nObj["title"].toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Image.asset(nObj["image"].toString(), width: 15, height: 15),
              const Spacer(),
              Text(
                "${nObj["value"].toString()} ${nObj["unit_name"].toString()}",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 4, left: 5, right: 5),
            child: Progresso(
              progressColor: Colors.blue.shade500,
              backgroundColor: Colors.grey.shade300,
              progress: double.parse((val / maxVal).toString()),
              progressStrokeCap: StrokeCap.round,
              backgroundStrokeCap: StrokeCap.round,
            ),
          ),
        ],
      ),
    );
  }
}
