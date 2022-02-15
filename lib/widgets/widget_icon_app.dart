import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color iconColor;
  final double size;
  final double iconSize;

  AppIcon({Key? key,
    required this.icon,
    this.background = const Color(0xfffcf4fe),
    this.iconColor = const Color(0xff050505),
    this.size = 40,
    this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: background),
      child: Icon(
        icon,
        color: iconColor,
        size :iconSize,
//todo 
      ),
    );
  }
}
