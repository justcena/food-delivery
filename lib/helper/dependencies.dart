import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repository.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.BASE_URL));
  //Repository
  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  //Controller
  Get.lazyPut(() => PopularProductController(popularProductRepository: Get.find()));

}
