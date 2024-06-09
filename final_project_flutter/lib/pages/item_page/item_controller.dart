import 'package:get/get.dart';

class ItemController extends GetxController {
  var isItemAdded = false.obs;

  void addItemToCart() {
    if (!isItemAdded.value) {
      isItemAdded.value = true;
      Get.snackbar(
        'Success',
        'Item added to cart!',
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        'Info',
        'Item already added to cart',
        duration: Duration(seconds: 2),
      );
    }
  }
}
