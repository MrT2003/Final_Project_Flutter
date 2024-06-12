import 'package:flutter/material.dart';
import 'package:final_project_flutter/core/colors/color.dart';

class MyAppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColor.blue,
      scaffoldBackgroundColor: AppColor.background,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 20),
        border: InputBorder.none,
      ),

      //style of word
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: AppColor.blue, fontSize: 30, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold, color: AppColor.blue),
        titleMedium: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        labelSmall: TextStyle(
            color: AppColor.white, fontSize: 14, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 18, color: AppColor.white),
      ),
      //icon
      iconTheme: const IconThemeData(
        size: 30,
        color: AppColor.blue,
      ),
      //outline button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.blue,
        ),
      ),
      //elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
          foregroundColor: AppColor.white,
        ),
      ),
    );
  }
}
