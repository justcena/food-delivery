import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepository extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepository({required this.apiClient});

  Future<Response> getRecommendedListResponse() async {
    return await apiClient.getData(Constants.RECOMMENDED_PRODUCT_URI);
  }
}
