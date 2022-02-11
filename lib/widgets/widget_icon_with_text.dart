import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/widget_text_small.dart';

class WidgetIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color iconColor;

  const WidgetIconWithText({
    Key? key,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        WidgetTextSmall(text: text, color: textColor)
      ],
    );
  }
}
