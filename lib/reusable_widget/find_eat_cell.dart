import 'package:flutter/material.dart';

class FindEatCell extends StatelessWidget {
  final Map fObj;
  final int index;
  const FindEatCell({super.key, required this.index, required this.fObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isEven = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 4, right: 4,),
      width: media.width * 0.5,
      decoration: BoxDecoration(
        //color: Colors.grey.shade100,
        color: isEven? Colors.blue.shade50 : Colors.deepPurple.shade50,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(75),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fObj["image"].toString(),
                width: media.width * 0.3,
                height: media.width * 0.25,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              fObj["name"],
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              fObj["number"],
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          //const SizedBox(height: 15),
          //SizedBox(height: media.width*0.02,),
          // Center(
          //   child: Container(
          //     //margin: EdgeInsets.only(top:30),
          //     width: media.width*0.2,
          //     height: media.width*0.1,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(25),
          //       color: Colors.blue.shade500,
          //     ),
          //     child: MaterialButton(
          //       onPressed: () {
          //         //Navigator.pop(context);
          //       },
          //       height: 10,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadiusGeometry.circular(25),
          //       ),
          //       textColor: Colors.white,
          //       child: Text(
          //         'Select',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
