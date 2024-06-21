import 'package:final_project_flutter/features/pages/home_page/homepage_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:final_project_flutter/features/pages/home_page/controller/home_page_controller.dart';

class SearchController_2 extends GetxController {
  final TextEditingController search = TextEditingController();
  final RxList<HomepageModel> filteredProductList = <HomepageModel>[].obs;
  final HomePageController h = Get.find<HomePageController>();
  final Rx<HomepageModel?> selectedProduct = Rx<HomepageModel?>(null);

  void searchProduct(String query) {
    List<HomepageModel> filteredList = [];

    for (var product in h.homepageList) {
      if (product.title
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        filteredList.add(product);
      }
    }

    filteredProductList.assignAll(filteredList);
  }

  List<String> getSuggestions(String query) {
    return h.homepageList
        .where((product) => product.title
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .map((product) => product.title)
        .toList();
  }

  HomepageModel? getProductByTitle(String title) {
    return h.homepageList.firstWhereOrNull((product) => product.title == title);
  }

  // Method to select a product by its title
  void selectProduct(String title) {
    selectedProduct.value = getProductByTitle(title);
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
