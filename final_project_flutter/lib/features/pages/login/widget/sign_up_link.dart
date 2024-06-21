import "package:final_project_flutter/core/colors/color.dart";
import "package:final_project_flutter/features/pages/signup/sign_up_view.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not a member ?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        // SizedBox(width: 10),
        TextButton(
          onPressed: () => Get.to(() => SignUpPage()),
          child: Text(
            'Register now',
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
