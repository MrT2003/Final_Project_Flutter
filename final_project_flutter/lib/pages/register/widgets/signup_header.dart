import 'package:final_project_flutter/core/colors/color.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.0, bottom: 30),
          child: Center(
            child: Icon(
              Icons.shopping_cart_rounded,
              size: 100,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          'HELLO GUYS!',
          style: TextStyle(
            color: AppColor.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Welcome to Minh Trieu shopping',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
