import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:final_project_flutter/pages/home_page/controller/home_page_controller.dart';

class SearchController_2 extends GetxController {
  final TextEditingController search = TextEditingController();
  final RxList<Map<String, dynamic>> filteredProductList =
      <Map<String, dynamic>>[].obs;
  final HomePageController h = Get.put(HomePageController());
  final Rx<Map<String, dynamic>?> selectedProduct =
      Rx<Map<String, dynamic>?>(null);

  void searchProduct(String query) {
    //Tạo ra 1 list trong đó có Map. Tại sao không dùng mỗi Map mà lại dùng List cùng
    List<Map<String, dynamic>> filteredList = [];

    //For này là for in hay for each
    for (var product in h.homepageList) {
      if (product['title']
          .toString() /*Tại sao lại chuyển thành toString và khi nào chuyển thành toString */
          .toLowerCase() /*Tại sao lại đặt lowcase ở đây */
          .contains(query
              .toLowerCase())) /*Check xem query này có chứa trong product title không */
      {
        filteredList.add(product);
      }
    }
    //Tại sao không để trong filteredList mà lại chuyển hết sang filteredProductList
    filteredProductList.assignAll(filteredList);
  }

  List<String> getSuggestions(String query) {
    return h.homepageList
        .where((product) =>
            product['title'] != null &&
            product['title']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .map((product) => product['title'].toString())
        .toList();
  }

  Map<String, dynamic>? getProductByTitle(String title) {
    return h.homepageList
        .firstWhereOrNull((product) => product['title'] == title);
  }

  void selectProduct(String title) {
    selectedProduct.value = getProductByTitle(title);
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
