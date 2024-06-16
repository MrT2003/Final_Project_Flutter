import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account? ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () => Get.to(() => LoginPage()),
          child: Text(
            'Login now',
            style: TextStyle(
              color: AppColor.blue,
            ),
          ),
          style: TextButton.styleFrom(
            minimumSize: Size(0, 0),
          ),
        ),
      ],
    );
  }
}
