import 'package:flutter/material.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/widget_icon_app.dart';
import 'package:food_delivery/widgets/widget_text_big.dart';
import 'package:food_delivery/widgets/widget_text_expandable.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.customRadius20),
                        topRight: Radius.circular(Dimentions.customRadius20))),
                child: Center(
                    child: WidgetTextBig(
                  color: Colors.black,
                  text: 'Sliver App Bar',
                  size: Dimentions.customFontSize26,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            backgroundColor: Colors.orange,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/image/food0.png',
                  width: double.maxFinite, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: WidgetTextExpandable(text: Constants.textDescription),
                  margin: EdgeInsets.only(
                      left: Dimentions.customWidth20,
                      right: Dimentions.customWidth20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimentions.customWidth10 * 2.5,
                right: Dimentions.customWidth10 * 2.5,
                top: Dimentions.customHeight10,
                bottom: Dimentions.customHeight10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconColor: Colors.white,
                    size: Dimentions.customIconSize24,
                    background: Colors.green,
                    icon: Icons.remove),
                WidgetTextBig(
                    color: Colors.black, text: '\$12.88' + '   X ' + '0'),
                AppIcon(
                    iconColor: Colors.white,
                    size: Dimentions.customIconSize24,
                    background: Colors.green,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
                  child: Icon(Icons.favorite,color: Colors.green,size: 24,)
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
        ],
      ),
    );
  }
}
