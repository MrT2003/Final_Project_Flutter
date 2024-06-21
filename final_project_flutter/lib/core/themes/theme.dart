import 'package:flutter/material.dart';
import 'package:final_project_flutter/core/colors/color.dart';

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.blue,
    scaffoldBackgroundColor: AppColor.background,
    //input theme
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.white,
        hintStyle: TextStyle(color: AppColor.blue /*grey */, fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),

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
      bodyLarge: TextStyle(
          color: AppColor.blue, fontWeight: FontWeight.bold, fontSize: 16),
      bodyMedium: TextStyle(fontSize: 18, color: AppColor.white),
      bodySmall: TextStyle(color: AppColor.blue, fontSize: 17),
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

  // You can add darkTheme here if needed
  // static final ThemeData darkTheme = ThemeData(
  //   // Define dark theme settings
  // );
}
