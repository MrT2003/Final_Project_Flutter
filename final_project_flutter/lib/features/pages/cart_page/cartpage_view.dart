import 'package:final_project_flutter/features/pages/cart_page/widgets/cart_app_bar.dart';
import 'package:final_project_flutter/features/pages/cart_page/widgets/cart_bottom_nav_bar.dart';
import 'package:final_project_flutter/features/pages/cart_page/widgets/cart_coupon.dart';
import 'package:final_project_flutter/features/pages/cart_page/widgets/cart_item_sample.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const CartAppBar(),
            Container(
              height: 700,
              decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  CartItemSample(),
                  CartCoupon(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CartBottomNavBar(),
      ),
    );
  }
}
