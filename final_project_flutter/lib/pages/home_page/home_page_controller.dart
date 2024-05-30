import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var homepageList = [].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    Dio dio = Dio();
    try {
      final response = await dio.get('https://fakestoreapi.com/products',
          queryParameters: {'_limit': 10});
      homepageList.value = response.data;
      isLoading.value = false;
    } catch (e) {
      print("Failed to load data: $e");
    }
  }
}
