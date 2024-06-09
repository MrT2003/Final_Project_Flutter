import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  Future<void> addProduct(
      String title, String description, double price, String image) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        'https://fakestoreapi.com/products',
        data: {
          'title': title,
          'description': description,
          'price': price,
          'image': image,
        },
      );
      homepageList.add(response.data);
    } catch (e) {
      print("Failed to add product: $e");
    }
  }

  Future<void> removeProduct(int id) async {
    Dio dio = Dio();
    try {
      await dio.delete('https://fakestoreapi.com/products/$id');
      homepageList.removeWhere((product) => product['id'] == id);
    } catch (e) {
      print("Failed to remove product: $e");
    }
  }
}
