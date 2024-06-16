import 'dart:convert';

import 'package:final_project_flutter/core/services/api_service.dart';
import 'package:final_project_flutter/pages/home_page/homepage_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var favouriteList = <HomepageModel>[].obs;
  var homepageList = <HomepageModel>[].obs;
  var cartList = <HomepageModel>[].obs;
  final ApiService _apiService = ApiService();
  SharedPreferences? _prefs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
    fetchProducts();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadFavourites();
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

  Future<void> loadFavourites() async {
    final String? favsString = _prefs?.getString('favouriteList');
    if (favsString != null) {
      final List favsJson = jsonDecode(favsString);
      favouriteList
          .addAll(favsJson.map((e) => HomepageModel.fromJson(e)).toList());
    }
  }

  Future<void> saveFavourites() async {
    final String favsString =
        jsonEncode(favouriteList.map((e) => e.toJson()).toList());
    await _prefs?.setString('favouriteList', favsString);
  }

  Future<void> addProductToFavourite(HomepageModel product) async {
    try {
      if (!favouriteList.contains(product)) {
        favouriteList.add(product);
        await saveFavourites();
      }
    } catch (e) {
      print("Failed to add product: $e");
    }
  }

  Future<void> removeProductFromFavourite(HomepageModel product) async {
    try {
      if (favouriteList.contains(product)) {
        favouriteList.remove(product);
        await saveFavourites();
      }
    } catch (e) {
      print("Failed to remove product: $e");
    }
  }

  bool isProductInFavorites(HomepageModel product) {
    return favouriteList.contains(product);
  }

  /*--------------------------------------------------------------------------------------*/

  Future<void> loadCart() async {
    final String? favsString = _prefs?.getString('cartList');
    if (favsString != null) {
      final List favsJson = jsonDecode(favsString);
      cartList.addAll(favsJson.map((e) => HomepageModel.fromJson(e)).toList());
    }
  }

  Future<void> saveCart() async {
    final String favsString =
        jsonEncode(cartList.map((e) => e.toJson()).toList());
    await _prefs?.setString('cartList', favsString);
  }

  Future<void> addProductToCart(HomepageModel product) async {
    try {
      if (!cartList.contains(product)) {
        cartList.add(product);
        await saveCart();
      }
    } catch (e) {
      print("Failed to add product to cart: $e");
    }
  }

  Future<void> removeProductFromCart(HomepageModel product) async {
    try {
      if (cartList.contains(product)) {
        cartList.remove(product);
        await saveCart();
      }
    } catch (e) {
      print("Failed to remove product from cart: $e");
    }
  }
}
