import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forge/screens/progress/comparison.dart';

class ProgressPhoto extends StatefulWidget {
  const ProgressPhoto({super.key});

  @override
  State<ProgressPhoto> createState() {
    return _ProgressPhotoState();
  }
}

class _ProgressPhotoState extends State<ProgressPhoto> {
  List photoArr = [
    {
      "time": "2 June",
      "photo": [
        "images/pp_1.png",
        "images/pp_2.png",
        "images/pp_3.png",
        "images/pp_4.png",
      ],
    },
    {
      "time": "5 May",
      "photo": [
        "images/pp_5.png",
        "images/pp_6.png",
        "images/pp_7.png",
        "images/pp_8.png",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool _reminderActive = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        scrolledUnderElevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(media.width * 0.06),
          ),
        ),
        title: Text(
          'Progress',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: media.width * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                      decoration: BoxDecoration(
                        //color: const Color(0xffFFE5E5),
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(media.width * 0.1),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 1),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(media.width),
                            ),
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: Image.asset(
                              "images/date_notifi.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(width: media.width * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Reminder!",
                                  style: TextStyle(
                                    color: Colors.red.shade600,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  "Next Photos Fall On July 08",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //height: 0,
                            alignment: Alignment.topRight,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                //TODO[REMOVE REMINDER]
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 20,
                      ),
                      //height: media.width * 0.4,
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   colors: [
                        //     Colors.blue.withValues(alpha: 0.4),
                        //     Colors.blue.withValues(alpha: 0.4),
                        //   ],
                        // ),
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(media.width * 0.1),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 1),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //SizedBox(height: media.width*0.03),
                              Text(
                                "Track Your Progress Each\nMonth With Photo",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: media.width * 0.04),
                              Container(
                                height: 30,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: MaterialButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      25,
                                    ),
                                  ),
                                  textColor: Colors.white,
                                  child: Text(
                                    'Learn More',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "images/progress_each_photo.png",
                            width: media.width * 0.35,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: media.width * 0.03),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.only(
                      top: 14,
                      bottom: 14,
                      right: 14,
                      left: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(media.width * 0.05),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 1),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //SizedBox(width: media.width*0.01,),
                        Text(
                          "Compare my Photo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: Container(
                            //height: 40,
                            //width: 75,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (_) => Comparison())
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
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gallery",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See more",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16,),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: photoArr.length,
                    itemBuilder: ((context, index) {
                      var pObj = photoArr[index] as Map? ?? {};
                      var imaArr = pObj["photo"] as List? ?? [];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                            child: Text(
                              pObj["time"].toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: imaArr.length,
                              itemBuilder: ((context, indexRow) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imaArr[indexRow] as String? ?? "",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: media.width*0.04,),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.1),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          //TODO[UPLOAD PHOTO]
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            //gradient: LinearGradient(colors: [Colors.deepPurple]),
            color: Colors.blue,
            borderRadius: BorderRadius.circular(27.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(Icons.photo_camera, size: 20, color: Colors.white),
        ),
      ),
    );
  }
}
