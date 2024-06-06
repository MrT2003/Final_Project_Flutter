import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/cart_page/cart_app_bar.dart';
import 'package:final_project_flutter/pages/cart_page/cart_bottom_nav_bar.dart';
import 'package:final_project_flutter/pages/cart_page/cart_item_sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            CartAppBar(),
            Container(
              height: 700,
              /*double.infinity */
              // padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                // // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartItemSample(),
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Add Coupon Code",
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
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
