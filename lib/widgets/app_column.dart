import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/widget_icon_with_text.dart';
import 'package:food_delivery/widgets/widget_text_small.dart';

import '../utils/dimensions.dart';
import 'widget_text_big.dart';

class AppColumn extends StatelessWidget {
  final String text;


  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTextBig(text: text, color: Colors.black),
        SizedBox(height: Dimentions.customHeight4),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, color: Colors.green, size: 15)),
            ),
            SizedBox(width: Dimentions.customHeight5),
            WidgetTextSmall(text: '4.5'),
            SizedBox(width: Dimentions.customHeight5),
            WidgetTextSmall(text: '1287'),
            SizedBox(width: Dimentions.customHeight5),
            WidgetTextSmall(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimentions.customHeight10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            WidgetIconWithText(
                text: 'Normal',
                textColor: Colors.grey,
                icon: Icons.circle_sharp,
                iconColor: Colors.orange),
            WidgetIconWithText(
                text: 'Normal',
                textColor: Colors.grey,
                icon: Icons.location_on,
                iconColor: Colors.lightGreenAccent),
            WidgetIconWithText(
                text: 'Normal',
                textColor: Colors.grey,
                icon: Icons.access_time_rounded,
                iconColor: Colors.red),
          ],
        )
      ],
    );
  }
}
