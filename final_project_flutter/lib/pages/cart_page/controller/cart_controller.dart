import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/cart_page/controller/cart_page_controller.dart';
import 'package:final_project_flutter/pages/home_page/controller/home_page_controller.dart';
import 'package:final_project_flutter/pages/home_page/homepage_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final HomePageController h = Get.put(HomePageController());

  var items = <int, int>{}.obs;
  var selectedProductId = <int>[].obs;

  void increment(HomepageModel product) {
    if (items.containsKey(product.id)) {
      items[product.id] = items[product.id]! + 1;
    } else {
      items[product.id] = 1;
    }
  }

  void decrement(HomepageModel product) {
    if (items.containsKey(product.id) && items[product.id]! > 0) {
      items[product.id] = items[product.id]! - 1;
      if (items[product.id] == 0) {
        Get.defaultDialog(
          title: "Confirmation",
          titleStyle: TextStyle(color: AppColor.blue),
          middleText: "Do you really want to remove this item?",
          middleTextStyle: TextStyle(color: Colors.black),
          textConfirm: "Yes",
          buttonColor: AppColor.blue,
          textCancel: "No",
          onConfirm: () {
            h.removeProductFromCart(product);
            Get.back();
          },
          onCancel: () {
            increment(product);
          },
        );
      }
    }
  }

  int getQuantity(HomepageModel product) {
    return items[product.id] ?? 0;
  }

  double getTotalPrice() {
    double total = 0;
    selectedProductId.forEach((itemId) {
      if (items.containsKey(itemId)) {
        final item =
            h.homepageList.firstWhere((element) => element.id == itemId);
        total += item.price * items[itemId]!;
      }
    });
    return total;
  }

  void toggleProduct(int id) {
    if (selectedProductId.contains(id)) {
      selectedProductId.remove(id);
    } else {
      selectedProductId.add(id);
    }
  }
}
