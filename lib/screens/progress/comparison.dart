import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/icon_title_next_row.dart';
import 'package:forge/screens/progress/result.dart';

class Comparison extends StatefulWidget {
  const Comparison({super.key});

  @override
  State<Comparison> createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 8,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.vertical(
          //   bottom: Radius.circular(media.width * 0.06),
          // ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        title: Text(
          'Comparison',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            IconTitleNextRow(
              icon: Icons.date_range,
              title: "Select Month 1",
              time: "May",
              onPressed: () {},
              color: Colors.grey.shade100,
            ),
            SizedBox(height: media.width * 0.03),
            IconTitleNextRow(
              icon: Icons.date_range,
              title: "Select Month 2",
              time: "select Month",
              onPressed: () {},
              color: Colors.grey.shade100,
            ),
            const Spacer(),
            Container(
              //height: 30,
              width: media.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultView(
                        date1: DateTime(2023, 5, 1),
                        date2: DateTime(2023, 6, 1),
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(25),
                ),
                textColor: Colors.white,
                child: Text(
                  'Compare',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
