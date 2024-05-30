import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Product",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Spacer(),
          Icon(
            Icons.favorite,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
