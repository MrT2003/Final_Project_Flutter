import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final HomePageController h = Get.put(HomePageController());
  var items = <int, int>{}.obs;

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
        items.remove(itemId);
        Get.defaultDialog(
          title: "Confirmation",
          titleStyle: TextStyle(color: AppColor.blue),
          middleText: "Do you really want to remove this item?",
          middleTextStyle: TextStyle(color: Colors.black),
          textConfirm: "Yes",
          buttonColor: AppColor.blue,
          textCancel: "No",
          onConfirm: () {
            items.remove(itemId);
            Get.back();
          },
          onCancel: () {
            increment(itemId);
            // Get.back();
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
}
