import 'package:final_project_flutter/pages/favourite_page/model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  var favouriteProduct = [].obs;

  void addProductToFavourites(Product product) {
    if (!favouriteProduct.contains(product)) {
      favouriteProduct.add(product);
    }
  }

  void removeProductFromFavourite(Product product) {
    if (favouriteProduct.contains(product)) {
      favouriteProduct.remove(product);
    }
  }
}
