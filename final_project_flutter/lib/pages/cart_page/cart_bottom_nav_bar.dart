import 'package:final_project_flutter/core/colors/color.dart';
import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      height: 130,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                    ),
              ),
              Text(
                "\$250",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 25,
                    ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Check Out",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 18,
                  ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
