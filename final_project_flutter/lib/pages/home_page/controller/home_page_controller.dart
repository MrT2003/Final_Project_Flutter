import 'package:final_project_flutter/core/services/api_service.dart';
import 'package:final_project_flutter/pages/home_page/homepage_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var favouriteList = <HomepageModel>[].obs;
  var homepageList = <HomepageModel>[].obs;
  var cartList = <HomepageModel>[].obs;
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final products = await _apiService.fetchProduct();
      homepageList.addAll(products
          .map((product) => HomepageModel(
                id: product.id,
                title: product.title,
                description: product.description,
                price: product.price,
                image: product.image,
              ))
          .toList());
    } catch (e) {
      print("Failed to load products: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addProductToFavourite(HomepageModel product) async {
    try {
      if (!favouriteList.contains(product)) {
        favouriteList.add(product);
      }
    } catch (e) {
      print("Failed to add product: $e");
    }
  }

  Future<void> removeProductFromFavourite(HomepageModel product) async {
    try {
      if (favouriteList.contains(product)) {
        favouriteList.remove(product);
      }
    } catch (e) {
      print("Failed to remove product: $e");
    }
  }

  bool isProductInFavorites(HomepageModel product) {
    return favouriteList.contains(product);
  }

  Future<void> addProductToCart(HomepageModel product) async {
    try {
      if (!cartList.contains(product)) {
        cartList.add(product);
      }
    } catch (e) {
      print("Failed to add product to cart: $e");
    }
  }

  Future<void> removeProductFromCart(HomepageModel product) async {
    try {
      if (cartList.contains(product)) {
        cartList.remove(product);
      }
    } catch (e) {
      print("Failed to remove product from cart: $e");
    }
  }
}
