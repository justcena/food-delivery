import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

class PopularProductRepository extends GetxService {
  final ApiClient apiClient;

  PopularProductRepository({required this.apiClient});

  Future<Response> getPopularListResponse() async {
    // todo create url for this methode
    return await apiClient.getData(Constants.PUPULAR_PRODUCT_URI);
  }
}
