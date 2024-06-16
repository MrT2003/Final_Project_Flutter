import 'package:final_project_flutter/core/colors/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 90.0),
        child: Center(
          child: Icon(
            Icons.shopping_cart_rounded,
            size: 100,
            color: Colors.black,
          ),
        ),
      ),
      Text(
        'HELLO AGAIN!',
        style: Theme.of(context).textTheme.headlineLarge,
        // TextStyle(
        //   color: AppColor.blue,
        //   fontSize: 30,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
      SizedBox(height: 10),
      Text(
        'Welcome back, you\'ve been missed',
        style: TextStyle(color: Colors.black),
      ),
      SizedBox(height: 30),
    ]);
  }
}
