import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/item_page/item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBottomNavBar extends StatelessWidget {
  final ItemController itemc = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${Get.arguments['price']}',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
          ),
          ElevatedButton.icon(
            onPressed: () => itemc.addItemToCart(),
            icon: Icon(CupertinoIcons.cart_badge_plus),
            label: Text(
              'Add To Cart',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
    // );
  }
}
