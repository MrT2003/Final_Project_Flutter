import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/cart_page/controller/cart_controller.dart';
import 'package:final_project_flutter/pages/cart_page/controller/cart_page_controller.dart';
import 'package:final_project_flutter/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemSample extends StatelessWidget {
  final CartController cart = Get.put(CartController());
  final HomePageController h = Get.put(HomePageController());
  // final CartPageController cartpagecontroller = Get.put(CartPageController());
  // final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: h.cartList.length,
          itemBuilder: (context, index) {
            final product = h.cartList[index];
            return Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Obx(() => Checkbox(
                        value: cart.selectedProductId.contains(product.id),
                        activeColor: AppColor.blue,
                        onChanged: (bool? value) {
                          cart.toggleProduct(product.id);
                        },
                      )),
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 15),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                product.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 18),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('error in here');
                                Get.defaultDialog(
                                  title: "Confirmation",
                                  titleStyle: TextStyle(color: AppColor.blue),
                                  middleText:
                                      "Do you really want to remove this item?",
                                  middleTextStyle:
                                      TextStyle(color: Colors.black),
                                  textConfirm: "Yes",
                                  buttonColor: AppColor.blue,
                                  textCancel: "No",
                                  onConfirm: () {
                                    h.removeProductFromCart(product);
                                    Get.back();
                                  },
                                  onCancel: () {},
                                );
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () => cart.increment(product),
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 18,
                                      color: AppColor.blue,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Obx(
                                    () => Text(
                                      '${cart.getQuantity(product)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () => cart.decrement(product),
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      size: 18,
                                      color: AppColor.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }
        // },
        );
  }
}
