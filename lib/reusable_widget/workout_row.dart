import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';

class WorkoutRow extends StatelessWidget {
  final Map wObj;
  const WorkoutRow({super.key, required this.wObj});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 10, left: 12, right: 2),
      margin: EdgeInsets.symmetric(vertical: 6),
      width: media.width,
      decoration: BoxDecoration(
        //gradient: LinearGradient(colors: [])
        color: Colors.white,
        borderRadius: BorderRadius.circular(media.width * 0.05),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(25),
            child: Image.asset(
              wObj['image'].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    wObj['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: media.width*0.005,),
                  Text(
                    "${wObj['kcal']} calories burnt | ${wObj['time']}minutes",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: media.width*0.005,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 4, left: 5,),
                    child: Progresso(
                      progressColor: Colors.blue.shade400,
                      backgroundColor: Colors.grey.shade300,
                      progress: double.parse(wObj['progress']),
                      progressStrokeCap: StrokeCap.round,
                      backgroundStrokeCap: StrokeCap.round,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.navigate_next_outlined),
          ),
        ],
      ),
    );
  }
}
