import 'package:final_project_flutter/features/pages/favourite_page/favourite_view.dart';
import 'package:final_project_flutter/features/pages/home_page/homepage_view.dart';
import 'package:final_project_flutter/features/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    MyHomePage(),
    FavouriteView(),
    const ProfilePage(),
  ];

  void changPage(int index) {
    selectedIndex.value = index;
  }
}
