import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 2),
        child: Container(
          width: media.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(30),
                child: Image.asset(
                  nObj['image'].toString(),
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nObj['title'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: media.width * 0.005),
                    Text(
                      nObj['time'].toString(),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
