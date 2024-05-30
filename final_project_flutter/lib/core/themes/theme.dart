import 'package:flutter/material.dart';
import 'package:final_project_flutter/core/colors/color.dart';

class MyAppTheme {
  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: AppColor.blue,
      ),

      titleMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),

      labelSmall: TextStyle(
        color: AppColor.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: TextStyle(fontSize: 18, color: AppColor.white),

      // bodyMedium:
    ),
    /////
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 20),
      border: InputBorder.none,
    ),
    iconTheme: IconThemeData(
      size: 30,
      color: AppColor.blue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(AppColor.blue),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
    ),
  );
}

// 1) làm thế nào Theme e fix đc color và font weight thôi còn fontsize có thể điều chỉnh được => dùng copywith()
// 2) Xuất hiện 2 circle  -- shimmer loading
// 3) Title quá dài -- set trong TextStyle()
// 4) điều chỉnh data trong API
// 5) Không nên gọi ảnh từ network =>  CatchedNetworkImage
// 6) thầy có thể hướng dẫn em kết hợp curvedNavigationBar và Getx
