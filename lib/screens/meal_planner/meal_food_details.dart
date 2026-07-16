import 'package:flutter/material.dart';
import 'package:forge/reusable_widget/meal_category_cell.dart';
import 'package:forge/reusable_widget/meal_recommend_cell.dart';
import 'package:forge/reusable_widget/popular_meals_row.dart';
import 'package:forge/screens/meal_planner/food_info_details.dart';

class MealFoodDetailsView extends StatefulWidget {
  final Map eObj;
  const MealFoodDetailsView({super.key, required this.eObj});

  @override
  State<MealFoodDetailsView> createState() => _MealFoodDetailsViewState();
}

class _MealFoodDetailsViewState extends State<MealFoodDetailsView> {
  TextEditingController txtSearch = TextEditingController();

  List categoryArr = [
    {"name": "Salad", "image": "images/c_1.png"},
    {"name": "Cake", "image": "images/c_2.png"},
    {"name": "Pie", "image": "images/c_3.png"},
    {"name": "Smoothies", "image": "images/c_4.png"},
    {"name": "Salad", "image": "images/c_1.png"},
    {"name": "Cake", "image": "images/c_2.png"},
    {"name": "Pie", "image": "images/c_3.png"},
    {"name": "Smoothies", "image": "images/c_4.png"},
  ];

  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "images/f_1.png",
      "b_image": "images/pancake_1.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "230kCal",
    },
    {
      "name": "Salmon Nigiri",
      "image": "images/f_2.png",
      "b_image": "images/nigiri.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "120kCal",
    },
  ];

  List recommendArr = [
    {
      "name": "Honey Pancake",
      "image": "images/rd_1.png",
      "size": "Easy",
      "time": "30mins",
      "kcal": "180kCal",
    },
    {
      "name": "Canai Bread",
      "image": "images/m_4.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "230kCal",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        title: Text(
          widget.eObj["name"].toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_horiz_rounded),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txtSearch,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search Pancake",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 1,
                    height: 25,
                    color: Colors.grey.withValues(alpha: 0.3),
                  ),
                  InkWell(onTap: () {}, child: Icon(Icons.filter_alt)),
                ],
              ),
            ),
            SizedBox(height: media.width * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: categoryArr.length,
                itemBuilder: (context, index) {
                  var cObj = categoryArr[index] as Map? ?? {};
                  return MealCategoryCell(cObj: cObj, index: index);
                },
              ),
            ),
            SizedBox(height: media.width * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Recommendation\nfor Diet",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.6,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: recommendArr.length,
                itemBuilder: (context, index) {
                  var fObj = recommendArr[index] as Map? ?? {};
                  return MealRecommendCell(fObj: fObj, index: index);
                },
              ),
            ),
            SizedBox(height: media.width * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Popular",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularArr.length,
              itemBuilder: (context, index) {
                var fObj = popularArr[index] as Map? ?? {};
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FoodInfoDetails(dObj: fObj, mObj: widget.eObj),
                      ),
                    );
                  },
                  child: PopularMealRow(mObj: fObj),
                );
              },
            ),
            SizedBox(height: media.width * 0.05),
          ],
        ),
      ),
    );
  }
}
