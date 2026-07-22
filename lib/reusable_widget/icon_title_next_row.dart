
import 'package:flutter/material.dart';

class IconTitleNextRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final VoidCallback onPressed;
  final Color color;
  const IconTitleNextRow({super.key, required this.icon, required this.title, required this.time, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Icon(icon)
            ),
            SizedBox(width: media.width*0.02,),
            Expanded(
              child: Text(
                title ,
                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              width: 120,
              child: Text(
               time ,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 25,
              height: 25,
              child:  Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  // child: Image.asset(
                  //   "assets/img/p_next.png",
                  //   width: 12,
                  //   height: 12,
                  //   fit: BoxFit.contain,
                  // ),
                  child: Icon(Icons.navigate_next_rounded),
                ),
              
            )
          ],
        ),
      ),
    );
  }
}