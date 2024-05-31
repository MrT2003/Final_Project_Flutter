import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/core/state/cart_controller.dart';
import 'package:final_project_flutter/pages/home_page/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemSample extends StatelessWidget {
  final CartController cart = Get.put(CartController());
  final HomePageController h = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Radio(
                  value: "",
                  groupValue: "",
                  activeColor: AppColor.blue,
                  onChanged: (index) => null,
                ),
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 15),
                  child: CachedNetworkImage(
                    imageUrl: h.homepageList[i]['image'],
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons
                        .error), // Widget hiển thị khi xảy ra lỗi khi tải hình ảnh
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
                              h.homepageList[i]['title'],
                              style: TextStyle(
                                color: Color(0xFF4C53A5),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Hiển thị hộp thoại xác nhận trước khi xóa mục
                              Get.defaultDialog(
                                title: "Confirmation",
                                titleStyle: TextStyle(color: AppColor.blue),
                                middleText:
                                    "Do you really want to remove this item?",
                                middleTextStyle: TextStyle(color: Colors.black),
                                textConfirm: "Yes",
                                buttonColor: AppColor.blue,
                                textCancel: "No",
                                onConfirm: () {
                                  // Xóa mục hàng khỏi giỏ hàng
                                  cart.items.remove(i);
                                  Get.back();
                                },
                                onCancel: () {
                                  // Get.back();
                                },
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
                            '\$${h.homepageList[i]['price'].toString()}',
                            style: TextStyle(
                              color: Color(0xFF4C53A5),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
                                  onTap: () => cart.increment(i),
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
                                    '${cart.getQuantity(i)}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5),
                                    ),
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
                                  onTap: () => cart.decrement(i),
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
          ),
      ],
    );
  }
}
