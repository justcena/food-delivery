import 'package:food_delivery/data/model/product.dart';
import 'package:get/get.dart';

import '../repository/recommended_product_repository.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepository recommendedProductRepository;

  RecommendedProductController({required this.recommendedProductRepository});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepository.getRecommendedListResponse();
    if (response.statusCode == 200) {
      print('------------>RecommendedSuccess');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print(_recommendedProductList);
      _isLoaded=true;
      update();
    } else {
      print(response.statusCode);
      print('Error');
    }
  }
}
