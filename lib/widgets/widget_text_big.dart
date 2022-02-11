import 'package:flutter/material.dart';

class WidgetTextBig extends StatelessWidget {
  Color? color;
  final String text;
  double size;

  TextOverflow overflow;

  WidgetTextBig({
    Key? key,
    required this.text,
    this.color = Colors.green,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Cormorant',
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size),
    );
  }
}
