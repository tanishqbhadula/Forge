import 'package:flutter/material.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});
  State<WorkoutDetails> createState() {
    return _WorkoutDetailsState();
  }
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.deepPurple.shade100],
        ),
        //color: Colors.blue,
      ),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              //shadowColor: Colors.black12,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              expandedHeight: media.width * 0.2,
              leading: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
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
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz_rounded, color: Colors.black),
                  ),
                ),
                SizedBox(width: media.width * 0.01),
              ],
            ),
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 56,
              leading: const SizedBox(),
              expandedHeight: media.width * 0.5 ,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/what_1.png',
                  width: media.width*0.75,
                  height: media.width*0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },

        body: Container(
          // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 1, top: 1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        height: 4,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
