import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';

import '../../widgets/widget_icon_app.dart';
import '../../widgets/widget_icon_with_text.dart';
import '../../widgets/widget_text_big.dart';
import '../../widgets/widget_text_small.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food15.jpeg'))),
              )),
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
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimentions.popularFoodImgSize,
              child: Container(
                padding: EdgeInsets.only(left: 21, top: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimentions.customWidth20),
                      topRight: Radius.circular(Dimentions.customWidth20)),
                  color: Colors.white,
                ),
                child:AppColumn(text: 'Chinese Side',)
              )),
        ],
      ),
    );
  }
}
