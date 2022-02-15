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
                AppIcon(icon: Icons.shopping_cart_outlined),
                AppIcon(icon: Icons.clear)
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
          Row(children: [
            AppIcon(icon: Icons.remove),
            AppIcon(icon: Icons.add),
          ],)
        ],
      ),
    );
  }
}
