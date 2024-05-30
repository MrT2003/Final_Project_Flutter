import 'package:final_project_flutter/pages/cart_page/cart_page.dart';
import 'package:final_project_flutter/pages/home_page/home_app_bar.dart';
import 'package:final_project_flutter/pages/home_page/my_home_page.dart';
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
