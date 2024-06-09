import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/pages/home_page/controller/navigationbar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBar_2 extends StatelessWidget {
  final NavigationBarController n = Get.put(NavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => n.pages[n.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          color: AppColor.blue,
          index: n.selectedIndex.value,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            n.selectedIndex(index);
          },
          height: 70,
          items: [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home,
                size: 30,
                color: AppColor.white,
              ),
              label: "Home",
              labelStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            CurvedNavigationBarItem(
              child: Icon(
                CupertinoIcons.cart_fill,
                size: 30,
                color: AppColor.white,
              ),
              label: "Cart",
              labelStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.person_2_rounded,
                size: 30,
                color: AppColor.white,
              ),
              label: "Profile",
              labelStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
