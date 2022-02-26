import 'package:food_delivery/data/model/product.dart';
import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;

  PopularProductController({required this.popularProductRepository});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity=> _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepository.getPopularListResponse();
    if (response.statusCode == 200) {
      print('------------>Success');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print(response.statusCode);
      print('Error');
    }
  }

  void setQuantity(bool inIncrement) {
    if (inIncrement) {
      print('increment');
      _quantity=checkQuantity(_quantity+1);
    } else {
      print('decrement');
      _quantity=checkQuantity(_quantity-1);
    }update();
  }


 int checkQuantity(int quantity){
    if (quantity<0) {
      return 0;
    }else if(quantity>20){
      return 20;
    }else {
      return quantity;
    }
  }
}
