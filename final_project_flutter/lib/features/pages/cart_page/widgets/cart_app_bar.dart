import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Icon(
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
          const Spacer(),
          const Icon(
            Icons.more_vert,
          ),
        ],
      ),
    );
  }
}
