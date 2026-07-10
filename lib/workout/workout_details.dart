import 'package:flutter/material.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});
  State<WorkoutDetails> createState() {
    return _WorkoutDetailsState();
  }
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  List youArr = [
    {"image": "images/barbell.png", "title": "Barbell"},
    {"image": "images/skipping_rope.png", "title": "Skipping Rope"},
    {"image": "images/bottle.png", "title": "Bottle 1 Liters"},
  ];
  var _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey.shade800,
          ),
        ),
        //elevation: 10,
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: _isFavorite
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(Icons.favorite_border, color: Colors.grey.shade800),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: media.height * 0.01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fullbody workout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: media.width * 0.01),
                    Text(
                      '11 Exercises | 60min | 520cals Burnt',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.height * 0.02),
                Container(
                  padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(media.width * 0.05),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey.shade800),
                      SizedBox(width: media.width * 0.02),
                      //Spacer(),
                      Expanded(
                        child: Text(
                          softWrap: true,
                          maxLines: 2,
                          'Schedule Workout',
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(width: media.width * 0.08),
                      //Spacer(),
                      Text(
                        softWrap: true,
                        maxLines: 2,
                        '26/4, 09:00AM',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 16,
                        ),
                      ),
                      //Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.04),
                Container(
                  padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(media.width * 0.05),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.insert_chart_outlined_sharp,
                        color: Colors.grey.shade800,
                      ),
                      SizedBox(width: media.width * 0.02),
                      //Spacer(),
                      //Expanded(
                      //child:
                      Text(
                        'Difficulty',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      //),
                      //SizedBox(width: media.width*0.08,),
                      Spacer(),
                      Text(
                        softWrap: true,
                        'Beginner',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 16,
                        ),
                      ),
                      //Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "You'll Need",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${youArr.length} items',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: media.width * 0.5,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: youArr.length,
                    itemBuilder: (context, index) {
                      var yObj = youArr[index] as Map? ?? {};
                      return Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: media.width * 0.35,
                              width: media.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(15),
                                border: BoxBorder.all(
                                  color: Colors.black12,
                                  width: 1.5
                                )
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                yObj["image"].toString(),
                                width: media.width * 0.2,
                                height: media.width * 0.2,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                              child: Text(
                                yObj["title"].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: media.width*0.01,),
                Text(
                  'Exercises',
                  style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
