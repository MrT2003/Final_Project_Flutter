import 'package:final_project_flutter/pages/cart_page/cartpage_view.dart';
import 'package:final_project_flutter/pages/home_page/widgets/home_app_bar.dart';
import 'package:final_project_flutter/pages/home_page/homepage_view.dart';
import 'package:final_project_flutter/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    MyHomePage(),
    CartPage(),
    ProfilePage(),
  ];

  void changPage(int index) {
    selectedIndex.value = index;
  }
}
