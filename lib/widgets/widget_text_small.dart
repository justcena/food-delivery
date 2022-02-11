import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class WidgetTextSmall extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  WidgetTextSmall(
      {Key? key,
      required this.text,
      this.color = Colors.grey,
      this.size = 0,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Cormorant',
          color: color,
          height: height,
          fontSize: size==0?Dimentions.customFontSize12:size),
    );
  }
}
