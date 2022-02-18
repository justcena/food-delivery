import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepository extends GetxService {
  final ApiClient apiClient;

  PopularProductRepository({required this.apiClient});

  Future<Response> getPopularListResponse() async {
    // todo create url for this methode
    return await apiClient.getData('https://www.dbestech.com/api/product/list');
  }
}
