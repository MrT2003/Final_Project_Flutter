import 'package:dio/dio.dart';
import 'package:final_project_flutter/pages/favourite_page/model.dart';

class ApiService {
  final Dio _dio = Dio();
  static String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProduct() async {
    try {
      final response = await _dio.get(apiUrl, queryParameters: {'_limit': 10});
      List<dynamic> data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
