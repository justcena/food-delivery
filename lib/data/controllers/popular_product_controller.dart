import 'package:food_delivery/data/model/product.dart';
import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;

  PopularProductController({required this.popularProductRepository});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepository.getPopularListResponse();
    if (response.statusCode == 200) {
      print('------------>Success');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    } else {
      print(response.statusCode);
      print('Error');
    }
  }
}
