import 'package:flutter/material.dart';
import 'package:forge/workout/workout_details.dart';

class WantToTrainRow extends StatefulWidget {
  final Map wObj;
  const WantToTrainRow({super.key, required this.wObj});
  State<WantToTrainRow> createState() {
    return _WantToTrainRowState();
  }
}

class _WantToTrainRowState extends State<WantToTrainRow> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
        borderRadius: BorderRadius.circular(media.width * 0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.wObj['title'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: media.width * 0.005),
                Text(
                  '${widget.wObj['exercises'].toString()} | ${widget.wObj['time'].toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: media.width * 0.03),
                Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (_) => WorkoutDetails(),
                        )
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(25),
                    ),
                    textColor: Colors.white,
                    child: Text(
                      'View More',
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(widget.wObj['image'].toString(), height: 100, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
