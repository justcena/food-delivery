import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/widgets/widget_text_big.dart';
import 'package:food_delivery/widgets/widget_text_small.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // showing heater
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      WidgetTextBig(text: 'Country'),
                      Row(
                        children: [
                          WidgetTextSmall(text: 'City', color: Colors.black),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
          ),
          // showing body
          FoodPageBody()
        ],
      ),
    );
  }
}
