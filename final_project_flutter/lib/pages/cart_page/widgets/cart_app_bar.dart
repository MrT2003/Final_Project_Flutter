import 'package:final_project_flutter/core/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Cart',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
          ),
        ],
      ),
    );
  }
}
