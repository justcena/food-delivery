import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/model/product.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/widget_icon_with_text.dart';
import 'package:food_delivery/widgets/widget_text_big.dart';
import 'package:food_delivery/widgets/widget_text_small.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimentions.pageView;

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
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
            margin: EdgeInsets.only(top: Dimentions.customHeight20),
            height: Dimentions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position,
                      popularProducts.popularProductList[position]);
                }),
          )
              : CircularProgressIndicator();
        }),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length <= 1
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
                activeColor: Colors.lightGreen,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
        }), //popular text
        SizedBox(height: Dimentions.customHeight20),
        Container(
          margin: EdgeInsets.only(left: Dimentions.customWidth20),
          child: Row(
            children: [
              WidgetTextBig(text: 'Recommended'),
              SizedBox(width: Dimentions.customWidth20),
              Container(
                margin: EdgeInsets.only(bottom: 42),
                child: WidgetTextBig(text: '.'),
              ),
            ],
          ),
        ),
        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? Container(
            height: 900,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: Dimentions.customWidth10,
                        left: Dimentions.customWidth10,
                        right: Dimentions.customWidth10),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimentions.customRadius20),
                              color: Colors.black,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(Constants.BASE_URL +
                                      Constants.UPLOAD_URL+ recommendedProduct.recommendedProductList[index].img))),
                        ),
                        Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          Dimentions.customWidth10),
                                      topLeft: Radius.circular(
                                          Dimentions.customWidth10))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: Dimentions.customWidth10,
                                    left: Dimentions.customWidth10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    WidgetTextBig(
                                        text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(
                                        height: Dimentions.customWidth10),
                                    WidgetTextSmall(text: recommendedProduct.recommendedProductList[index].description!),
                                    SizedBox(
                                        height: Dimentions.customWidth10),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            iconColor:
                                            Colors.lightGreenAccent),
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
                            ))
                      ],
                    ),
                  );
                }),
          )
              : CircularProgressIndicator();
        })
      ],
    );
  }

  Widget _buildPageItem(int position, Products products) {
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
      var heightTransfer = _height * (1 - currentScale) * 2 / 4;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, heightTransfer, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - position) * (1 - _scaleFactor);
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
            height: Dimentions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimentions.customHeight10,
              right: Dimentions.customHeight10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.customRadius20),
                color: position.isEven ? Colors.blue : Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      Constants.BASE_URL + Constants.UPLOAD_URL +
                          products.img!),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimentions.customHeight40,
                  right: Dimentions.customHeight40,
                  bottom: Dimentions.customHeight10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(Dimentions.customRadius20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimentions.customHeight10,
                    left: Dimentions.customHeight10,
                    right: Dimentions.customHeight10),
                child: AppColumn(
                  text: products.name.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
