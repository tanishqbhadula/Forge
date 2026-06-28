import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Username',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: media.width * 0.05),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                        iconSize: media.width * 0.09,
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.01),
                  Container(
                    //padding: EdgeInsets.all(16),
                    //height: media.width * 0.4,
                    width: media.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade300,
                          Colors.deepPurple.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(media.width * 0.1),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/bg_dots.png',
                          fit: BoxFit.fitHeight,
                          width: double.maxFinite,
                          height: media.width * 0.4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BMI (Body Mass Index)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'You have a normal weight',
                                    style: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.7,
                                      ),
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: media.width * 0.05),
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.pink.shade400, Colors.deepPurple.shade400
                                        ]),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        height: 50,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(25),
                                        ),
                                        textColor: Colors.white,
                                        child: Text(
                                          'View More',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
