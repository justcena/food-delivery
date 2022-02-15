import 'package:flutter/material.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/widget_text_expandable.dart';

import '../../widgets/widget_icon_app.dart';
import '../../widgets/widget_icon_with_text.dart';
import '../../widgets/widget_text_big.dart';
import '../../widgets/widget_text_small.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food15.jpeg'))),
              )),
          //icons widgets
          Positioned(
              right: Dimentions.customWidth10,
              left: Dimentions.customWidth10,
              top: Dimentions.customWidth40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios_new),
                    AppIcon(icon: Icons.shopping_cart_outlined)
                  ])),
          //intro of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimentions.popularFoodImgSize,
              child: Container(
                  padding: const EdgeInsets.only(left: 21, top: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.customWidth20),
                        topRight: Radius.circular(Dimentions.customWidth20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColumn(text: 'Chinese Side'),
                      SizedBox(height: Dimentions.customHeight20),
                      WidgetTextBig(text: 'Introduce'),
                      SizedBox(height: Dimentions.customHeight20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: WidgetTextExpandable(
                              text: Constants.textDescription),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(
            top: Dimentions.customHeight20,
            bottom: Dimentions.customHeight20,
            right: Dimentions.customHeight20,
            left: Dimentions.customHeight20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.customRadius20),
                topRight: Radius.circular(Dimentions.customRadius20)),
            color: Colors.white10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimentions.customRadius20),
                  color: Colors.white),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: Colors.grey),
                  SizedBox(width: Dimentions.customWidth10),
                  WidgetTextBig(text: '0'),
                  SizedBox(width: Dimentions.customWidth10),
                  const Icon(Icons.add, color: Colors.grey)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimentions.customRadius20),
                  color: Colors.green),
              child: Row(
                children: [
                  SizedBox(width: Dimentions.customWidth10),
                  WidgetTextBig(
                      text: '\$10 | Add to cart', color: Colors.white),
                  SizedBox(width: Dimentions.customWidth10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
