import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/cart_page/cart_page_controller.dart';
import 'package:final_project_flutter/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final HomePageController h = Get.put(HomePageController());
  final CartPageController cart = Get.put(CartPageController());
  var items = <int, int>{}.obs;
  var selectedProductId = <int>[].obs;

  void increment(int itemId) {
    if (items.containsKey(itemId)) {
      items[itemId] = items[itemId]! + 1;
    } else {
      items[itemId] = 1;
    }
  }

  void decrement(int itemId) {
    if (items.containsKey(itemId) && items[itemId]! > 0) {
      items[itemId] = items[itemId]! - 1;
      if (items[itemId] == 0) {
        Get.defaultDialog(
          title: "Confirmation",
          titleStyle: TextStyle(color: AppColor.blue),
          middleText: "Do you really want to remove this item?",
          middleTextStyle: TextStyle(color: Colors.black),
          textConfirm: "Yes",
          buttonColor: AppColor.blue,
          textCancel: "No",
          onConfirm: () {
            cart.removeProductFromCart(itemId);
            items.remove(itemId);
            Get.back();
          },
          onCancel: () {
            increment(itemId);
          },
        );
      }
    }
  }

  int getQuantity(int itemId) {
    return items[itemId] ?? 0;
  }

  double getTotalPrice() {
    double total = 0;
    items.forEach((itemId, quantity) {
      final itemPrice = h.homepageList[itemId]['price'];
      total += itemPrice * quantity;
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
