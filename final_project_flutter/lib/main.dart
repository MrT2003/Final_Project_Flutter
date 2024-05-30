import 'package:final_project_flutter/core/themes/theme.dart';
import 'package:final_project_flutter/pages/cart_page/cart_page.dart';
import 'package:final_project_flutter/pages/home_page/bottom_navigation_bar.dart';
import 'package:final_project_flutter/pages/home_page/my_home_page.dart';
import 'package:final_project_flutter/pages/item_page/item_page.dart';
import 'package:final_project_flutter/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:badges/badges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyAppTheme.lightTheme,
      initialRoute: '/',
      getPages: [
        // GetPage(name: '/', page: () => BottomNavigationBar_2()),
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/cartPage', page: () => CartPage()),
        GetPage(name: '/itemPage', page: () => ItemPage()),
        GetPage(name: '/profilePage', page: () => ProfilePage()),
      ],
      home: BottomNavigationBar_2(),
    );
  }
}
