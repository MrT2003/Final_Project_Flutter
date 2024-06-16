import 'package:final_project_flutter/core/colors/color.dart';
import 'package:flutter/material.dart';

class CartCoupon extends StatelessWidget {
  const CartCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColor.blue, borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        Text(
          "Add Coupon Code",
          style: Theme.of(context).textTheme.bodyLarge,
          // TextStyle(
          //   color: AppColor.blue,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // ),
        )
      ],
    );
  }
}
