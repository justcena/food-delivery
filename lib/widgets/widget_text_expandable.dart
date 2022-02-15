import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/widget_text_small.dart';

class WidgetTextExpandable extends StatefulWidget {
  final String text;

  const WidgetTextExpandable({Key? key, required this.text}) : super(key: key);

  @override
  _WidgetTextExpandableState createState() => _WidgetTextExpandableState();
}

class _WidgetTextExpandableState extends State<WidgetTextExpandable> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimentions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? WidgetTextSmall(text: firstHalf,size:16.6)
            : Column(
                children: [
                  WidgetTextSmall(
                    height: 1.4,
                    size: 16,
                      text: hiddenText
                          ? (firstHalf + '...')
                          : firstHalf + secondHalf),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        WidgetTextSmall(text: 'show more'),
                        Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up)
                      ],
                    ),
                  )
                ],
              ));
  }
}
