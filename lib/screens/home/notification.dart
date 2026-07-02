import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/notification_row.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<NotificationScreen> {
  List notificationArr = [
    {"image": "images/Workout1.png", "title": "Hey, its time for lunch", "time": "About 1 minutes ago"},
    {"image": "images/Workout2.png", "title": "Don't miss your lowerbody workout", "time": "About 3 hours ago"},
    {"image": "images/Workout3.png", "title": "Hey, let's add some meals for your body", "time": "About 3 hours ago"},
    {"image": "images/Workout1.png", "title": "Congratulations, You have finished Ab workout", "time": "29 May"},
    {"image": "images/Workout2.png", "title": "Hey, it's time for lunch", "time": "8 April"},
    {"image": "images/Workout3.png", "title": "Ups, You have missed your Lowerbody workout", "time": "8 April"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.black,),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:8.0, bottom: 8, left: 8, right: 2),
        child: ListView.separated(
          itemCount: notificationArr.length,
          itemBuilder: ((context,index) {
            var nObj = notificationArr[index] as Map? ?? {};
            return NotificationRow(nObj: nObj);
          }), 
          separatorBuilder: (context,index) {
            return Divider(
              color: Colors.grey.shade200,
              height: 1,
              indent: 12,
              endIndent: 20,
              thickness: 1.5,
            );
          }, 
        ),
      ),
    );
  }
}