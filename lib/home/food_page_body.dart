import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/widget_icon_with_text.dart';
import 'package:food_delivery/widgets/widget_text_big.dart';
import 'package:food_delivery/widgets/widget_text_small.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220.0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print(_currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 260,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
              activeColor: Colors.lightGreen,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        )
      ],
    );
  }

  Widget _buildPageItem(int position) {
    Matrix4 matrix = Matrix4.identity();
    if (position == _currentPageValue.floor()) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var heightTransfer = _height * (1 - currentScale) * 2 / 4;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, heightTransfer, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor +
          (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currentTransfer = _height * (1 - currentScale) * 2;
      var heightTransfer = _height * (1 - currentScale) * 2 / 4;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, heightTransfer, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTransfer = _height * (1 - currentScale) * 2;
      var heightTransfer = _height * (1 - currentScale) * 2 / 4;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, heightTransfer, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: position.isEven ? Colors.blue : Colors.grey,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/food0.png'))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 110,
              margin: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetTextBig(text: 'Chinese Side', color: Colors.black),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(Icons.star,
                                  color: Colors.green, size: 15)),
                        ),
                        const SizedBox(width: 5),
                        WidgetTextSmall(text: '4.5'),
                        const SizedBox(width: 5),
                        WidgetTextSmall(text: '1287'),
                        const SizedBox(width: 5),
                        WidgetTextSmall(text: 'comments'),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
