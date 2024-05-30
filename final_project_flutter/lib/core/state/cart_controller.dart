import 'package:get/get.dart';

class CartController extends GetxController {
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
        items.remove(itemId); // Remove item if quantity is 0
      }
    }
  }

  int getQuantity(int itemId) {
    return items[itemId] ?? 0;
  }
}
